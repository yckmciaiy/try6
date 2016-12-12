require 'glicko2'
 
class Api::V1::FormulasController < Api::V1::BaseController
  Rating = Struct.new(:rating, :rating_deviation, :volatility)
  def calculate
    @winboost_val = @loseboost_val = 1.0
    @formula = Formula.find(params[:formula_id])
    @ratings = params[:formula_params]
    if @formula.winstreak? && params[:winboost] 
	@winboost_val = @formula.winstreak_boost
    end
    if @formula.losestreak? && params[:loseboost]
	@loseboost_val = @formula.losestreak_boost
    end
    @winboost_val = @winboost_val.to_f
    @loseboost_val = @loseboost_val.to_f
    @calc = []
    @ratings.each do |rate|
      if @formula.glicko?
        @calc << [rate[:r], rate[:rd], rate[:sigma]]
      else
        @calc << [rate[:r]]
      end
    end
    if @formula.glicko?
      glicko_result
    else
      elo_result
    end
    if @formula.use_extra_params && @formula.extra_params.any?
      calculate_extra 
    end
    @results = []
    @calc.each do |c|
      if @formula.glicko?
        @results << {:Rating => c[0], :Rating_deviations => c[1].round, 
		:Volatile => c[2].round(2)}
      else
        @results << {:Rating => c[0]}
      end
    end
    @results
  end

  def glicko_result

    rate1 = @calc[0];
    rate2 = @calc[1];

    rating1 = Rating.new(rate1[0].to_i, rate1[1].to_f, rate1[2].to_f)
    rating2 = Rating.new(rate2[0].to_i, rate2[1].to_f, rate2[2].to_f)

    period = Glicko2::RatingPeriod.from_objs([rating1, rating2])
    period.game([rating1, rating2], [1,2])

    next_period = period.generate_next
    next_period.players.each { |p| p.update_obj }
    glic = Array.new (2)
    glic[0] = Array.new([parse_glicko(rating1), 
		parse_rd(rating1), parse_vol(rating1)])
    glic[1] = Array.new([parse_glicko(rating2), 
		parse_rd(rating2), parse_vol(rating2)])
    if @formula.use_extra_params && @formula.extra_params.any?
      delta_rating1 = glic[0][0]-(@calc[0][0].to_i).round
      delta_rating2 = 3*(glic[1][0]-(@calc[1][0].to_i)).round
    else
      delta_rating1 = 2*(glic[0][0]-(@calc[0][0].to_i)).round
      delta_rating2 = 2*(glic[1][0]-(@calc[1][0].to_i)).round
    end
  
    @calc[0][0] = @calc[0][0].to_i + (delta_rating1 * @winboost_val).round
    @calc[0][1] = glic[0][1]
    @calc[0][2] = glic[0][2]

    @calc[1][0] = @calc[1][0].to_i + (delta_rating2 * @loseboost_val).round
    @calc[1][1] = glic[1][1]
    @calc[1][2] = glic[1][2]
    
  end

  def parse_glicko(rate)
    rate.to_s.split[2].split('=')[1].to_f
  end
  def parse_rd(rate)
    rate.to_s.split[3].split('=')[1].to_f
  end
  def parse_vol(rate)
    rate.to_s.split[4].split('=')[1].to_f
  end
  def elo_result
    rating1 = @calc[0][0].to_i
    rating2 = @calc[1][0].to_i
    k1 = @ratings[0][:k].to_i
    k2 = @ratings[1][:k].to_i
    d_rating1 = k1*(@winboost_val)*(
	1 - 1.0/(1+10.0**((rating2 -rating1)/400.0))) 
    d_rating2 = -1.0*k2*(@loseboost_val)*
	1.0/(1+10.0**((rating1 -rating2)/400.0))
    if @formula.use_extra_params && @formula.extra_params.any?
      rating1 += d_rating1.round
      rating2 += (3*d_rating2).round
    else
      rating1 += (2*d_rating1).round
      rating2 += (2*d_rating2).round
    end
    @calc[0][0] = rating1
    @calc[1][0] = rating2
  end

  def calculate_extra
    a = []
    sum1 = sum2 = 0
    my_params1 = @ratings[0][:xtra_prams]
    my_params2 = @ratings[1][:xtra_prams]
    weights = 0
    
    @formula.extra_params.each do |param|
      weights += param[:weight].to_i
      a << param[:weight].to_i
    end
    ind = 0
    my_params1.each do |pram|
      average = pram[:avrg].to_f
      value = pram[:param].to_f
      new_value = Math.log((value**3)/(average**2) , average)
      sum1 += a[ind] * (normal new_value)
      ind += 1
    end
    
    ind = 0
    my_params2.each_with_index do |pram|
      sum2 += a[ind] * normal(Math.log(
		(pram[:param].to_f**3)/
		(pram[:avrg].to_f**2) , pram[:avrg].to_f ))
      ind+=1
    end
    
    sum1 /= weights
    sum2 /= weights
    @calc[0][0] = (@calc[0][0]).to_i + sum1.round
    @calc[1][0] = (@calc[1][0]).to_i + sum2.round
  end

  def normal(value)
    if value < -2 
      -2
    elsif value > 2
      2
    else
      value
    end
  end

  def calculate_params
    params.permit(:formula_id, :winboost, :loseboost,
			formula_params: [:r, :rd, :k, :sigma,
			xtra_prams: [:param, :avrg] ])
  end
end

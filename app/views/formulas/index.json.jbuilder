json.array!(@formulas) do |formula|
  json.extract! formula, :id, :user_id, :title, :win_points, :lose_points, :glicko, :winstreak, :losestreak, :winstreak_boost, :losestreak_boost, :extra_params
  json.url formula_url(formula, format: :json)
end

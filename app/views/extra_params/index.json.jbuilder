json.array!(@extra_params) do |extra_param|
  json.extract! extra_param, :id, :title, :weight, :formula_id
  json.url extra_param_url(extra_param, format: :json)
end

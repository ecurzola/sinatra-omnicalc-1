require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end


get("/square/new") do
  erb(:homepage)
end

get("/square/results") do
  @num = params.fetch("number").to_f
  @num_squared = @num * @num
  
  erb(:square_result)
end


get("/square_root/new") do
  erb(:root)
end

get("/square_root/results") do
  @num = params.fetch("user_number").to_f
  @num_square_root = @num ** 0.5

  erb(:root_result)
end


get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @random = rand(@min..@max).to_f
  
  erb(:random_result)
end


get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = (params.fetch("user_apr").to_f).to_fs(:percentage, precision: 4)
  apr_calc = @apr.to_f / 100
  @years = params.fetch("user_years").to_i
  years_calc = @years.to_f
  @principal = (params.fetch("user_pv").to_f).to_fs(:currency)
  principal_calc = params.fetch("user_pv").to_f
  @numerator = (apr_calc/12) * principal_calc
  @denominator = 1 - (1 + (apr_calc/12)) ** -(years_calc * 12)
  @payment = (@numerator / @denominator).to_fs(:currency)
  
  erb(:payment_result)
end

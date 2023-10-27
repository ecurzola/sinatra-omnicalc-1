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

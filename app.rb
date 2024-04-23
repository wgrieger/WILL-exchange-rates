require "sinatra"
require "sinatra/reloader"

get("/") do
  erb (:home)
end

#get ("/:#insert here") do 
#@currency= 
#@output=parse.(somethingelse)
#erb (:display_page)
#end

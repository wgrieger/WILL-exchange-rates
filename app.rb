require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

#data grabbing code
#data grabbing code

@currency1="USD"
@currency2="GBP"

#listing
exchange_key= ENV["EXCHANGE"]
base= "https://api.exchangerate.host/"
list_resource= "list"
key= "?access_key=" + exchange_key.to_s
@list_url= base + list_resource + key
list_data_raw= HTTP.get(@list_url)
json_list_data=JSON.parse(list_data_raw)



@all_currencies_hash= json_list_data.fetch("currencies")
@all_currencies_array= Array.new
@all_currencies_array.push(@all_currencies_hash)

#list end

#converting
exchange_key= ENV["EXCHANGE"]
base= "https://api.exchangerate.host/"
convert_resource= "convert"
key= "?access_key=" + exchange_key.to_s
exchange_ticks= "&from=" + @currency1 + "&to="+ @currency2 + "&amount=1"
@data_url= base + convert_resource + key + exchange_ticks

raw_data= HTTP.get(@data_url)
json_convert_data=JSON.parse(raw_data)

@result= json_convert_data.fetch("result").to_s
#converting end

        #end of data grabbing code

#beggining of trees
get("/") do
  erb (:home)
  #link that parses _ _ _ to _ _ _
end

get ("/test") do
erb(:test)
end 

#get ("/:#insert here") do 
#@currency= :insert here
#@output=parse.(somethingelse)
#erb (:display_page)
#end

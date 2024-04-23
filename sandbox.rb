require "http"
require "json"

@countr="USD"
@currency2="GBP"

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

pp @result

require 'rubygems'
require 'sinatra'
require 'sinatra/config_file'
require 'json'
require './ibge_parser'

before do
  cache_control :public, :must_revalidate, :max_age => 36000
end

config_file 'config.yml'

get '/' do
  @proxy = settings.proxy
  @message = {}
  @message["modo de usar"] = [{"GET" => "/[cidade]"},{"ex" => "/salvador ou /sal"}]
  if(request.host == 'localhost' && !@proxy['host'].nil?)
  	@message["proxy"] = @proxy 
	end
  erb :index
end

get '/:city' do |c|
	@proxy = settings.proxy
  ibge = IBGEParser.new
  if !@proxy['host'].nil?
  	ibge.proxy_host=@proxy['host']
  	ibge.proxy_port=@proxy['port']
	end
  @info = ibge.get_city_info(c)
  erb :city_info
end

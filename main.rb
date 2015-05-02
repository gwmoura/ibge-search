require 'rubygems'
require 'sinatra'
require 'json'
require './ibge_parser'

get '/' do
  @message = {}
  @message["modo de usar"] = [{"GET" => "/[cidade]"},{"ex" => "/salvador ou /sal"}] 
  erb :index
end

get '/:city' do |c|
  ibge = IBGEParser.new
  @info = ibge.get_city_info(c)
  erb :city_info
end

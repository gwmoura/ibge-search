require 'rubygems'
require 'nokogiri'
require 'ibge_parser'
require 'sinatra/config_file'
require 'main'

set :run, false

run Sinatra::Application

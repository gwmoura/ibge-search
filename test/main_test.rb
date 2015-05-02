ENV['RACK_ENV'] = 'test'

require '../main'
require 'test/unit'
require 'rack/test'

class MainTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    puts "test_index"
    get '/'
    assert last_response.ok?
    assert last_response.body.include?('modo de usar')
  end

  def test_get_city
    puts "test_get_city"
    get '/salvador'
    assert last_response.ok?
    assert last_response.body.include?('SALVADOR')
    assert last_response.body.include?('SALVADOR DO SUL')
  end
end
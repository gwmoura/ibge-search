# encoding: utf-8
ENV['RACK_ENV'] = 'test'

require '../ibge_parser'
require 'test/unit'
require 'rack/test'

class IBGEParserTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def test_get_city_info
    puts "test_get_city_info"
    ibge = IBGEParser.new
    cities = ibge.get_city_info('salvador')
    assert_equal 3, cities.length
    assert_equal 'SALVADOR', cities[0]['municipio']
    assert_equal 29, cities[0]['codigo_uf'] 
  end

  def test_parser
    puts "tes_parser"
    ibge = IBGEParser.new
    cities = ibge.parser("http://www.ibge.gov.br/home/geociencias/areaterritorial/area.php?nome=joao")
    assert_equal 11, cities.length
    r = Random.new
    i = r.rand(cities.length)
    assert cities[i]['municipio'].include?('JOÃO')
    assert_equal 21, cities[0]['codigo_uf']
  end
end
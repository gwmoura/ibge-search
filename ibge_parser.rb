require 'open-uri'
require 'nokogiri'

class IBGEParser
  
  def get_city_info(city)
    url = "http://www.ibge.gov.br/home/geociencias/areaterritorial/area.php?nome="+city
    parser(url)
  end

  def parser(url)
    html = Nokogiri::HTML(open(url))
    div = html.css('div[@id="miolo_interno"]')
    content = []
    if div.length > 0
      trs = div.css("tr")
      trs.each do |tr|
        td = tr.css('td')
        content.push(
          {
            "codigo_uf"=>td[0].content,
            "uf"=>td[1].content,
            "codigo_municipio"=>td[2].content,
            "municipio"=>td[3].content,
            "area"=>td[4].content
          }
        )
      end
      content.delete_at(0)
    end
    content
  end

end
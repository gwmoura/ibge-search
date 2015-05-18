require 'open-uri'
require 'nokogiri'

class IBGEParser

  attr_accessor :proxy_host, :proxy_port
  
  def get_city_info(city)
    url = "http://www.ibge.gov.br/home/geociencias/areaterritorial/area.php?nome="+city
    parser(url)
  end

  def parser(url)
    if !@proxy_host.nil?
      html = Nokogiri::HTML(open(url, :proxy => "http://"+@proxy_host+":"+@proxy_port.to_s ))
    else
      html = Nokogiri::HTML(open(url))
    end
    
    div = html.css('div[@id="miolo_interno"]')
    content = []
    if div.length > 0
      trs = div.css("tr")
      trs.each do |tr|
        td = tr.css('td')
        content.push(
          {
            "codigo_uf"=>td[0].content.to_i,
            "uf"=>td[1].content,
            "codigo_municipio"=>td[2].content.to_i,
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
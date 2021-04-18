require 'Nokogiri'
require 'open-uri'

class Scraper
  ipads = []
  doc = URI.open("https://www.backmarket.fr/ipad-reconditionnes.html")
  parsed_page = Nokogiri::HTML(doc)

  ipad_card = parsed_page.search("._31NccdTr._3CzsEFc12EYds_T_qwMJva").each do |element|
    names = element.search("._2RGsPtNo._3lpH2rfnyK5lbG1nNzuHdX").text
    prices = element.search("._3OcKBk8D._3MDjp2ItWod8Ii3KjoFBIJ").text.to_i
  end

  iphone_years = parsed_page.search("._1mDJHhzV3_TCnmBSNAJPj").each do |date|
    years = date.search("._3OcKBk8D.y7fDboA8_-UMGGxPRpiU_").value
  end
  p iphone_years
  # ipad_card = [names, prices, years]
  # ipads << ipad_card

  #     p "#{names} #{prices}€ #{years}"

end

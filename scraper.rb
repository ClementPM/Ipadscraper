require 'Nokogiri'
require 'open-uri'

class Scraper
  ipads = []
  doc = URI.open("https://www.backmarket.fr/ipad-reconditionnes.html")
  parsed_page = Nokogiri::HTML(doc)

  ipad_card = parsed_page.search("._31NccdTr._3CzsEFc12EYds_T_qwMJva").each do |element|
    names = element.search("._2RGsPtNo._3lpH2rfnyK5lbG1nNzuHdX").text.strip
    prices = element.search("._3OcKBk8D._3MDjp2ItWod8Ii3KjoFBIJ").text.to_i
    # years = element.search("._3OcKBk8D.y7fDboA8_-UMGGxPRpiU_").text.to_i

  # ipad_card = [names, prices, years]
  ipads << ipad_card

    puts "#{names} > #{prices}€"
  end
end
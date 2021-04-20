require 'Nokogiri'
require 'open-uri'

class Scraper

  attr_accessor :parsed_page
ipads = []
  def initialize
    doc = URI.open("https://www.backmarket.fr/ipad-reconditionnes.html")
    @parsed_page = Nokogiri::HTML(doc)
  end 

  def get_names
    names = parsed_page.search("._2RGsPtNo._3lpH2rfnyK5lbG1nNzuHdX").each do |element|
    ipads << names
    end
  end

  def get_prices
    prices = parsed_page.search("._3OcKBk8D._3MDjp2ItWod8Ii3KjoFBIJ").each do |element|
      p element.text
    end
  end

  # def get_years
  #   years = parsed_page.search("._3OcKBk8D.y7fDboA8_-UMGGxPRpiU_").each do |element|
  #     # p element.text
  #   end
  end

  scraper = Scraper.new
  names = scraper.get_names
  prices = scraper.get_prices
  years = scraper.get_years

  p get_years
end

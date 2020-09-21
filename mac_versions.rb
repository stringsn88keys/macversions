# frozen_string_literal: true

require 'uri'
require 'open-uri'
require 'nokogiri'

SEED = 'https://en.wikipedia.org/wiki/MacOS_High_Sierra'

initial_page = URI.parse(SEED).open(&:read)
nodes = Nokogiri::HTML(initial_page)
# puts nodes.xpath("//h2[text()='System Requirements']/following-sibling::ul")[0].to_html

# compatibility
puts nodes.xpath("//h2/span[@id='System_requirements']/../following-sibling::ul")[0].to_html

# version info
# puts nodes.xpath("//div[@class='mw-parser-output']/p")[1].to_html
version_info = nodes
               .xpath("//div[@class='mw-parser-output']/p")[1]
               .text
               .gsub(/(^.*\(version .*\)).*/, '\1')

puts version_info

summary = nodes
.xpath("//table[@class='']")
require 'anemone'

Anemone.crawl("http://en.wikipedia.org/wiki/Albert_Einstein") do |anemone|
  anemone.on_every_page do |page|
    puts page.url
  end
end

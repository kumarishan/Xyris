require 'rubygems'
require 'anemone'
require 'logger'
require 'open-uri'
require 'yaml'
require 'bishop'
 
#classifier = Bishop::Bayes::new { |probs,ignore| Bishop::robinson(probs, ignore) }
#
#Anemone.crawl("http://en.wikipedia.org/wiki/String_theory", :depth_limit => 1) do |anemone|
#  anemone.skip_links_like %r/.*png/, %r/.*jpg/, %r/.*jpeg/, %r/.*:.*/
#  anemone.on_every_page do |page|
#    puts page.url
#    title = page.doc.at('title').inner_html rescue nil
#    title = title.gsub!(/ \- Wikipedia, the free encyclopedia/s){""} rescue nil
#    if title != nil 
#      puts title
#      data = " "
#      page.doc.xpath("//p").each do |p|
#        temp_data = p.inner_html
#        temp_data = temp_data.gsub!(/(<[^>]*>)/s) {" "} rescue nil
#        if temp_data != nil 
#          data += temp_data
#        end
#      end
#      classifier.train(title, data) 
#    end
#  end
#end

#classifier.save()

classify = Bishop::Bayes::new { |probs,ignore| Bishop::robinson(probs, ignore) }
classify.load()

Anemone.crawl("http://en.wikipedia.org/wiki/Albert_Einstein", :depth_limit => 1) do |anemone|
  anemone.skip_links_like %r/.*png/, %r/.*jpg/, %r/.*jpeg/, %r/.*:.*/
  anemone.on_every_page do |page|
    puts page.url
    title = page.doc.at('title').inner_html rescue nil
    title = title.gsub!(/ \- Wikipedia, the free encyclopedia/s){""} rescue nil
    if title != nil 
      puts title
      data = " "
      page.doc.xpath("//p").each do |p|
        temp_data = p.inner_html
        temp_data = temp_data.gsub!(/(<[^>]*>)/s) {" "} rescue nil
        if temp_data != nil 
          data += temp_data
        end
      end
      results = classify.guess(data).sort_by{|score| -score.last}
      puts results.first[0].capitalize
    end
  end
end




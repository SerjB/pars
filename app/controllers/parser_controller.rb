# Parser controller, for parsing http://eslfuncast.libsyn.com/rss
class ParserController < ApplicationController
  def index
    @parser = []
    doc = Nokogiri::HTML(open('http://eslfuncast.libsyn.com/rss'))
    (0..2).each do |i|
      @parser << { name: doc.css('title')[i + 2].text,
                   source: doc.css('enclosure')[i]['url'] }
    end
  end
end

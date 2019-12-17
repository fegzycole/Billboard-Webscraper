# frozen_string_literal: true

# ! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

class Scraper # :nodoc:
  URL = 'https://www.billboard.com/charts/hot-100'
  def initialize
    @list_of_songs = []
  end

  def top_songs
    songs = generate_html.css('button.chart-element__wrapper')
    songs.each do |link|
      top_songs = {
        rank: link.css('span.chart-element__rank__number').text,
        title: link.css('span.chart-element__information__song').text,
        artist: link.css('span.chart-element__information__artist').text,
        weeks_on_count_down: link.css('span.chart-element__meta.text--week').text
      }
      @list_of_songs << top_songs
    end
    @list_of_songs
  end

  private

  attr_reader :url

  def generate_html
    doc = Nokogiri::HTML(URI.parse(URL).open)
    doc
  end
end

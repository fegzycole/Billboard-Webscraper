# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

class Scraper # :nodoc:
  URL = 'https://www.billboard.com/charts/hot-100'

  def initialize
    @list_of_songs = []
  end

  def get_top_songs
    if generate_html
      songs = generate_html.css('button.chart-element__wrapper')
      songs.each do |song|
        song_hash = {
          rank: song.css('span.chart-element__rank__number').text,
          title: song.css('span.chart-element__information__song').text,
          artist: song.css('span.chart-element__information__artist').text,
          weeks_on_count_down: song.css('span.chart-element__meta.text--week').text
        }
        @list_of_songs << song_hash
      end
      @list_of_songs
    end
  end

  private

  def generate_html
    begin
      doc = Nokogiri::HTML(URI.parse(URL).open)
      doc
    rescue => error
      puts "#{error.class} #{error.message}, check you internet connection and try again"
    end
  end
end

#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/scraper'

def scrape_songs
  billboard_scrapper = Scraper.new

  json_array = billboard_scrapper.get_top_songs

  if json_array
    File.open('songs.txt', 'w+') do |f|
      json_array.each { |song| f.puts(song) }
    end
    puts "File successfully generated!"
  end

end

scrape_songs

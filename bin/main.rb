#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/scraper'
require_relative '../lib/json_parser'

def scrape_songs
  billboard_scrapper = Scraper.new

  array_of_songs = billboard_scrapper.get_top_songs

  json_parser = JsonParser.new

  json_array = json_parser.convert_to_json(array_of_songs)

  File.open('songs.txt', 'w+') do |f|
    json_array.each { |song| f.puts(song) }
  end
end

scrape_songs

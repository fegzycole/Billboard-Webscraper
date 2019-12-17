#!/usr/bin/env ruby

# frozen_string_literal: true

require './lib/scraper'
require './lib/json_parser'

def scrape_songs
  billboard_scrapper = Scraper.new

  array_of_songs = billboard_scrapper.top_songs

  json_parser = JsonParser.new

  json_array = json_parser.convert_to_json(array_of_songs)

  File.open('songs.txt', 'w+') do |f|
    json_array.each { |song| f.puts(song) }
  end

  json_array
end

scrape_songs

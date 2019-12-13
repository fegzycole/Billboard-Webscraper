#!/usr/bin/env ruby

# frozen_string_literal: true

require './lib/scraper'
require './lib/json_parser'

billboard_scrapper = Scraper.new

array_of_songs = billboard_scrapper.top_songs

json_parser = JsonParser.new(array_of_songs)

puts json_parser.convert_to_json

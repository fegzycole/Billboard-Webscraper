#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/scraper'

def scrape_songs
  billboard_scrapper = Scraper.new

  puts 'Welcome to the Billboard scraper, specify a name for your file'

  file_name = gets.chomp

  json_array = billboard_scrapper.get_top_songs

  if json_array
    File.open("#{file_name}.txt", 'w+') do |f|
      json_array.each { |song| f.puts(song) }
    end
    puts "A file #{file_name}.txt has been created in the root directory"
  end

end

scrape_songs

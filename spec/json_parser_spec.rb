# frozen_string_literal: true

require_relative '../lib/json_parser'
require_relative '../lib/scraper'

describe JsonParser do
  let(:webscraper) { Scraper.new }
  let(:json_parser) { JsonParser.new }

  describe '#convert_to_json' do
    it 'should return an array' do
      hashed_songs = webscraper.top_songs
      expect(json_parser.convert_to_json(hashed_songs)).to be_an(Array)
    end

    it 'should return a 100 songs' do
      hashed_songs = webscraper.top_songs
      json_songs = json_parser.convert_to_json(hashed_songs)
      expect(json_songs.size).to eql(100)
    end
  end
end

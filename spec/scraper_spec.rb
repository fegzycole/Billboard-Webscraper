# frozen_string_literal: true

require_relative '../lib/scraper'

describe Scraper do
  let(:webscraper) { Scraper.new }

  describe '#top_songs' do
    it 'should return an array' do
      hashed_songs = webscraper.top_songs
      expect(hashed_songs).to be_an(Array)
    end

    it 'should be an array of hashes' do
      hashed_songs = webscraper.top_songs
      expect(hashed_songs[0]).to be_a(Hash)
    end

    it 'should have some specific keys' do
      hashed_song = webscraper.top_songs[0]
      array_of_keys = hashed_song.keys
      expect(array_of_keys).to eql(%i[rank title artist weeks_on_count_down])
    end

    it 'should contain 100 songs only' do
      hashed_songs = webscraper.top_songs
      expect(hashed_songs.size).to eql(100)
    end
  end
end

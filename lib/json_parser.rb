# frozen_string_literal: true

# ! /usr/bin/env ruby

require 'json'

class JsonParser # :nodoc:
  def initialize(hash_array)
    @hash_array = hash_array
    @json_array = []
  end

  def convert_to_json
    @hash_array.each { |hash| @json_array << hash.to_json }
    @json_array
  end
end
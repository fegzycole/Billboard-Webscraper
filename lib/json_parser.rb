# frozen_string_literal: true

# ! /usr/bin/env ruby

require 'json'

class JsonParser # :nodoc:
  def initialize
    @json_array = []
  end

  def convert_to_json(hash_array)
    hash_array.each { |hash| @json_array << hash.to_json }
    @json_array
  end
end

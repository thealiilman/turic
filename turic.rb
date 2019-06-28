require 'json'
require 'httparty'
require 'pp'

API_URL = "https://api.lyrics.ovh/v1".freeze

def prompt(*args)
  print(*args)
  gets.strip
end

puts 'Fetch the lyrics for the song of your choice.'
artist = prompt 'Artist name: '
tune = prompt 'Song name: '
request_url = URI.encode("#{API_URL}/#{artist}/#{tune}")
response = HTTParty.get(request_url)

# The \n is necessary so that there will be a line after the last prompt.
# Looked ugly without the spacing! 😨
puts "\n#{response['lyrics']}"

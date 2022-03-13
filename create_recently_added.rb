require 'mpd_client'
require 'uri'

module MPD
  class Client

    def recently_added(since_datetime)
      write_line("find modified-since #{since_datetime.strftime('%FT%TZ')}")
      fetch_songs
    end
  end
end

class SongPlaylistDecorator
  def decorate(song)
    artist = song["artist"]
    album = song["album"]
    file = song["file"]
    title = song["title"]

    {
      service: 'mpd',
      albumart: "/albumart?web=#{artist}/#{album}/extralarge&path=/mnt/#{URI.encode_www_form_component(file)}&icon=fa-tags&metadata=true",
      title: title,
      artist: artist,
      album: album,
      uri: file,
    }
  end
end

require 'date'
require 'json'
client = MPD::Client.new
client.connect('localhost', '6600')
client.update #this won't complete by the time we ask for recents, but why wait? the next cron job will get it.
start_of_week = DateTime.now.new_offset('-08:00').to_date - DateTime.now.new_offset('-08:00').to_date.wday
songs = client.recently_added(start_of_week)
puts "found songs for #{start_of_week}" if songs.length > 0
songs.each do |song|
  puts "#{song['file']} #{song['last-modified']}"
end
decorator = SongPlaylistDecorator.new
playlist_formatted_songs = songs.map do |song|
  decorator.decorate(song)
end
if playlist_formatted_songs.length > 0
  playlist_string = playlist_formatted_songs.to_json
  playlist_name = "Recently Added: #{start_of_week.strftime}"
  File.open("/data/playlist/#{playlist_name}", 'w') do |f|
    f.write(playlist_string)
  end
end

module SongsHelper
  
  def is_number?(string)
    true if Float(string) rescue false
  end
  
  def get_grooveshark_songs(songs_unsorted)
    songs = ""
    songs_unsorted.each do |song|
      if is_number?(song.link)
        songs << "#{song.link},"
      end
    end
    return songs.slice!(0..(songs.length-1))
  end
  
end

class Song 
  
  attr_accessor :artist, :name
  
  def initialize(name)
    @name = name 
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  
  def self.new_by_filename(file)
    song = self.new(file.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(file.split(" - ")[0])
    song.artist.add_song(song)
    song
  end

end
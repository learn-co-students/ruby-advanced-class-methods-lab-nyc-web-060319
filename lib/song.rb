class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.create
  newSong = Song.new
  newSong.save
  return newSong
end

def self.new_by_name(name)
  newSong = self.create
  newSong.name = name
  return newSong
end

def self.create_by_name(name)
  newSong = self.new_by_name(name)
  return newSong
end

def self.find_by_name(name)
  song = self.all.find do |songs|
    songs.name == name
  end
  return song
end

def self.find_or_create_by_name(name)
  song = self.find_by_name(name)
  if song == nil
    song = self.create_by_name(name)
  end
  return song
end

def self.alphabetical
  sorted = self.all.sort_by {|songs| songs.name}
  return sorted
end

def self.new_from_filename(string)
  artist = string[0..(string.index("-") - 2)]
  name = string[(string.index("-") + 2)..(string.index(".") - 1)]
  song = create_by_name(name)
  song.artist_name = artist
  return song
end

def self.create_from_filename(string)
  artist = string[0..(string.index("-") - 2)]
  name = string[(string.index("-") + 2)..(string.index(".") - 1)]
  song = create_by_name(name)
  song.artist_name = artist
  return song
end

def self.destroy_all
  @@all = []
end



end

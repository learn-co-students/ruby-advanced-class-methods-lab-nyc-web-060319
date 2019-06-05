class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name, artist_name)
    @name = name
    @artist_name = artist_name
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new(nil, nil)
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new(name, nil)
    song
  end

  def self.create_by_name(name)
    song = Song.new(name, nil)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      song = self.create_by_name(name)
      return song
    else
      return self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name }
  end

  def self.new_from_filename(filename)
    filename_parts = filename.split("-")
    artist = filename_parts[0].rstrip!
    song_name_parts = filename_parts[1].split(".")
    song_name = song_name_parts[0].lstrip!
    song = Song.new(song_name, artist)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
    song
  end

  def self.destroy_all
    @@all = []
  end
end


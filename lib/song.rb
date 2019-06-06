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
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = Song.new()
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = Song.new()
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(input)
    song = Song.new()
    info = input.split(" - ")
    song.artist_name = info[0]
    info = info[1].split(".")
    song.name =  info[0]
    return song
  end

  def self.create_from_filename(input)
    song = Song.new()
    info = input.split(" - ")
    song.artist_name = info[0]
    info = info[1].split(".")
    song.name =  info[0]
    song.save
    return song
  end

  def self.destroy_all
    @@all.clear
  end

  


end

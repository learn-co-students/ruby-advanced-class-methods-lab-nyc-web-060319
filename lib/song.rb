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
    new_song = Song.new
    new_song.save
    return new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil
      Song.create_by_name(name)
    else
      return Song.find_by_name(name)
    end
  end

  def self.new_from_filename(name)
    data = name.split(' - ')
    new_song = Song.new()
    new_song.artist_name = data[0]
    data = data[1].split('.')
    new_song.name = data[0]
    return new_song
  end

  def self.alphabetical
    Song.all.sort_by{|object| object.name}
  end

  def self.create_from_filename(name)
      data = name.split(' - ')
      new_song = Song.new()
      new_song.artist_name = data[0]
      data = data[1].split('.')
      new_song.name = data[0]
      new_song.save
      return new_song
  end

  def self.destroy_all
    @@all = []
  end

end

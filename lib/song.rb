class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    newSong = Song.new()
    newSong.save
    return newSong
  end

  def self.new_by_name(name)
    newSong = Song.new()
    newSong.name = name
    newSong
  end

  def self.create_by_name(name)
   newSong = Song.new()
   newSong.name = name
   newSong.save
   newSong
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

  def self.alphabetical
    Song.all.sort_by{|object| object.name}
  end

  def self.new_from_filename(name)
    data = name.split(' - ')
    newSong = Song.new()
    newSong.artist_name = data[0]
    data = data[1].split('.')
    newSong.name = data[0]
    return newSong
  end

  def self.create_from_filename(name)
    data = name.split(' - ')
    newSong = Song.new()
    newSong.artist_name = data[0]
    data = data[1].split('.')
    newSong.name = data[0]
    newSong.save
    return newSong
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

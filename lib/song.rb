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
    song = self.new
    self.all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    return song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    return self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file)
    name_whole = file.split('.')[0]
    name = name_whole.split(' - ')[1]
    artist_name = name_whole.split(' - ')[0]
    song = self.create_by_name(name)
    song.artist_name = artist_name
    return song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    self.all << song
    song
  end

  def self.destroy_all
    @@all = []
  end

end

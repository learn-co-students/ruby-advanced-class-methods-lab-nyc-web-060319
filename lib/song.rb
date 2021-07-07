require "pry"

class Song
  attr_accessor :name, :artist_name, :filename
  
  
  @@all = []

  
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
    #binding.pry
  end

  def self.create
    song = Song.new
    song.save
    #song.name = name
    @@all << song
    return song
  end

  # def name(name)
  #   @name = name
  # end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    @@all << song
    return song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    # @@all.each do |song|
    #   if song.name == name
    #     self.find_by_name(name)
    #   else
    #     self.create_by_name(name)
    #   end
    # end
  end

  def self.alphabetical
    @@all.uniq.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song = Song.new
    #song.filename = filename
    song.name = filename.split(/[.-]/)[1].strip
    song.artist_name = filename.split(/[.-]/)[0].strip
    #binding.pry
    return song
  end

  def self.create_from_filename(filename)
    song = Song.new
    #song.filename = filename
    song.name = filename.split(/[.-]/)[1].strip
    song.artist_name = filename.split(/[.-]/)[0].strip
    song.save
  end

  def self.destroy_all
    @@all = []
  end

end

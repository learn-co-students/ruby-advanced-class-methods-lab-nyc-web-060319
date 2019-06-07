require 'pry'
class Song
  attr_accessor :name, :artist_name
  
  @@songs = []

  def self.songs
    @@songs
  end

end
require 'pry'
class Song
  
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  # def save
  #   @@all >> self
  # end

  def self.create
    new_song = self.new
    @@all << new_song #new_song.save
    new_song
  end
  
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    # binding.pry
    @@all << new_song
    new_song
  end

  def self.song_names #returns array of JUST song names
    song_name_arr = @@all.map do |song_obj| #Look through all songs, subject them to below method, then from that array, make it unique
      song_obj.name
    end
    song_name_arr.uniq
    #Alternate method below
    # @@all.map.uniq do |song_obj|
    #   puts song_obj.name
    #   song_obj.name
    # end
  end

  def self.find_by_name(name) #find a song by name
    self.all.find { |song_obj| song_obj.name == name} #go through @@all, return first song object whose @name == name arg
  end

  def self.find_or_create_by_name(name)
    # if song exists in @@all, return it with find_by_name. If it doesn't exist, create it with create_by_name
      if self.find_by_name(name) #Use :find_by_name using name arg as arg. Will look through all song_objs to see if name arg == song_obj.name for all songs
        #If name == @name of one of song_objs in @@all, it is truthy, so it will..
        self.find_by_name(name) #...Use :find_by_name on name arg again to return the song whose @name == name arg
      else #If find cannot find any matches, returns nil, a falsey value, so the code below is run...
        self.create_by_name(name) #If name not found in @@all, make a new Song object with that name via create_by_name, which will also add the newly created song to the @@all song_obj list
      end
      # self.all
    end

    def self.alphabetical
      #returns all song_objs in order via their name
    # self.all.each.do |song_obj| #go through all song_objs... [C->@name=B, C->@name=A]
    #compare song_names...use map???
      sorted_songs = self.song_names.sort
      sorted_all = []
      sorted_songs.each do |song| #look through sorted songs...
          # binding.pry #write song here in pry to see what name is being used in iteration
            self.all.each do |song_obj| #look through all song objs
                # binding.pry #write song_obj here in pry to view what song_obj being used in iteration
                #compare song_obj@name with name in sorted_songs
                if song_obj.name == song #compare song_obj @name to name-str in sorted_songs. If they match, push song_obj to array
                  sorted_all << song_obj
                end
            end
      end
      sorted_all
    end

    def self.new_from_filename(filename) #remember self.create makes a new_song var = self.new and returns new_song
      #filename format "A - Song by A.mp3"
      new_song = self.new
      new_song.artist_name= filename.split(" ")[0]
      new_song.name= filename.split(/[-.]/)[1].strip
      # binding.pry
      new_song 
    end

    def self.create_from_filename(filename)
      new_song_from_filename = self.new_from_filename(filename)
      self.all << new_song_from_filename
      new_song_from_filename
    end

    def self.destroy_all
      @@all.clear
    end
end
binding.pry
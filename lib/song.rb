require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

 	def self.all 		# Class Getter Method
 	   @@all			
 	end				


  	def initialize(artist_name = "", name = "")
  		@name = name
  		@artist_name = artist_name
  	end


  	def self.create(artist_name = "", name = "") 
		    #=> self.class is : Class	
		    # obj => #<Song:0x00007ff23fab1d30 @artist_name="", @name="">
        
        obj = Song.new(artist_name, name)
        @@all << obj
		    return obj
  	end



                                    #only one param passed in bc "new by NAME"
                                    #therefore need to pop in "" for artist when #create
	def self.new_by_name(song_string)		# class custom constructor 
		  self.create("", song_string) 
	end						


								
								                    # method is "create by NAME" so you're def getting SONGname
  	def self.create_by_name(artist_name = "", new_song) 			# class custom constructor 
  		  temp = Song.new(artist_name, new_song)							
		    @@all << temp  		
  		  return temp				
  	end


  	def self.find_by_name(song_string)		#they want SONG name.
  		return_val = Song.all.find{|s| (s.name) == song_string }				 
  		return return_val
  	end


  	def self.find_or_create_by_name(song_string = "", name = "") # reverse the arguments!! 
  		if !find_by_name(song_string)	#didn't have the !! find the name is artist name... 										
  			 create_by_name(name, song_string) 	
  		else
  			return find_by_name(song_string)
  		end
  	end


  	def self.alphabetical
  		return Song.all.sort_by {|song| song.name }  #need to sort_by Song.name? 
  													 #yes, bc ea song is Object
  	#   return Song.all.sort_by! {|song| song } # got Error: 
    #    	expected: [nil, nil, nil]
    #     	got: [Song, Song, Song]
     
  	end




    def self.new_from_filename(mp3_string)        # FM: "Thundercat - For Love I Come.mp3"
      wip = mp3_string.split(" ")
      the_song = (wip.drop_while{ |i=0| i != "-" }).join(" ").gsub("-", " ").strip.chomp(".mp3")
      the_artist = mp3_string.slice(0..(mp3_string.length - the_song.length - 8) )
      Song.new(the_artist, the_song)
    end

    def extract_mp3_artist(mp3_string)       #Not used, didn't work
      wip = mp3_string.split(" ")
  	  # Arrary Enumerable to execute block(join to string) until reach "-" ? 
  		# try  drop + chomp
      # Below failing- cant compare string to 0
      # artist_title = (wip.drop_while{ |i= wip.find_index("-")|  i < ((wip.length)-6) } ).join(" ").strip
    end   


  	def self.create_from_filename(mp3_string)
  		new = self.new_from_filename(mp3_string)
  		@@all << new
  	end


  	def self.destroy_all
  		self.all.clear
  	end



end


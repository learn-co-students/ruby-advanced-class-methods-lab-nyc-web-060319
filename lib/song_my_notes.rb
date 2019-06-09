require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

 	def self.all 		# store all instances for Song that are created 
 	   @@all			# through the instance method Song#save
 	end				# is a Getter Method

	def self.save 			# test insist there is a "save" method
	  	#self.class.all << self 		# ?w/o "self.", got undefined method `save' for Song:Class
		@@all << self
	end

	# def save(new_song_obj)
	# 	@@all << new_song_obj
	# end


  	def initialize(artist_name = "", name = "")
  		@name = name
  		@artist_name = artist_name
  	end


  	def self.create(artist_name = "", name = "")    #(song_string = "unnamed").
		#puts "self.class is : #{self.class}"    #=> self.class is : Class	
		# Song.new(self)

		obj = Song.new(artist_name, name)

		@@all << obj
		

		# puts "test.class is : #{test.class}, test is #{test}"	#=> test's class = Song
		# return test.    
		# obj => #<Song:0x00007ff23fab1d30 @artist_name="", @name="">
		#binding.pry
		return obj

  	end




	def self.new_by_name(song_string)		# is OK // class constructor 
		self.create("", song_string) 	#  expect(song.name).to eq("Blank Space")
	end							#  undefined method `name' for []:Array


								# I guess bc method is named create_by_song_name, now artist
								# name is 2nd argument?? 
  	def self.create_by_name(artist_name = "", new_song) 			# class constructor 

  		#(Song.new(new_song)).save		# initializes a song
  										# saves it to the @@all class variable either 
  		temp = Song.new(artist_name, new_song)							
		@@all << temp  		
  		# temp.save					# can I shovel onto this? 
  		return temp				# literally or through the class method Song.all

  	end


  	def self.find_by_name(song_string)		# was 100% ok  Oh, they want SONG name.
  		return_val = Song.all.find{|s| (s.name) == song_string }				# was .find do 
		#binding.pry
  			 #song.artist_name == song_string
  		return return_val
  	end


  	def self.find_or_create_by_name(song_string = "", name = "") # reverse the arguments 
  		if !find_by_name(song_string)	#didn't have the !! find the name is artist name... 
  											
  			create_by_name(name, song_string) 	# before, started w:  lvar = 
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

  	# Arrary Enumerable to execute block(join to string) until reach "-" ? 

  											# drop + chomp




  	def self.new_from_filename(mp3_string)				# FM: "Thundercat - For Love I Come.mp3"
  		#the_artist = extract_mp3_artist(mp3_string)
  		#the_song = extract_mp3_songtitle(mp3_string)
		wip = mp3_string.split(" ")
		#the_artist = (wip.drop_while{ |i| i != "-" }).join(" ").strip 	#"- For Love I Come.mp3"
		the_song = (wip.drop_while{ |i=0| i != "-" }).join(" ").gsub("-", " ").strip.chomp(".mp3")
		the_artist = mp3_string.slice(0..(mp3_string.length - the_song.length - 8) )
		#the_song = (wip.drop_while{ |i= wip.find_index("-")|  i < ((wip.length)-6) } ).join(" ").strip
		

  		Song.new(the_artist, the_song)

  	end

  	def extract_mp3_artist(mp3_string)
  		 wip = mp3_string.split(" ")
  		#delimiter =   wip[]  #   wip.find(-)
  		#counter i = 0
  		
  		(wip.drop_while{ |i| i != "-" }).join(" ").gsub("-", " ").strip
  		#song_title = (wip.drop_while{ |i= wip.find_index("-")|  i < ((wip.length)-6) } ).join(" ").strip
		# Below failing- cant compare string to 0
		#the_artist = (wip.drop_while{ |i= wip.find_index("-")|  i < ((wip.length)-6) } ).join(" ").strip

	end  	

	def extract_mp3_songtitle(mp3_string)
		 wip = mp3_string.split(" ")
		(wip.drop_while{ |i= wip.find_index("-")|  i < ((wip.length)-6) } ).join(" ").strip
	end




  	def self.create_from_filename(mp3_string)
  		new = self.new_from_filename(mp3_string)
  		#new.save
  		@@all << new
  	end


  	def self.destroy_all
  		self.all.clear
  	end



end


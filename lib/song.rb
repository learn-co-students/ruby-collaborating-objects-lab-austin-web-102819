require_relative "artist.rb"

class Song

    attr_accessor :name, :artist, :artist_name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def artist_name=(artist_name)
        new_artist = Artist.all.find{|artist| artist.name == artist_name} || Artist.new(artist_name)
        self.artist = new_artist
    end

    def self.new_by_filename(file_name)
        parse = file_name.split(' - ')
        song_name = parse[1]
        artist_name = parse[0]
        new_song = Song.new(song_name)
        new_song.artist_name = artist_name
        new_song
    end

    def self.all
        @@all
    end
end


require_relative "song.rb"

class Artist

    attr_accessor :name

    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def print_songs
        artist_songs = Song.all.select{|song| song.artist == self}
        artist_songs.each{|song| puts "#{song.name}\n"}
    end

    def self.find_or_create_by_name(artist_name)
        new_artist = @@all.find{|artist| artist.name == artist_name} || Artist.new(artist_name)
    end
end
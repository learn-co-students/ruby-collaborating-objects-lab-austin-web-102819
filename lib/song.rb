require_relative 'artist'
class Song
    attr_accessor :artist, :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        arr = filename.split(" - ")

        song_name = arr[1]
        artist_name = arr[0]
        song = self.new(song_name)
        artist = Artist.new(artist_name)
        artist.add_song(song)
        song
    end

    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
        self.artist = @artist
    end
end

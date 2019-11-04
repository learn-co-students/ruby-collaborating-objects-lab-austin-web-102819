require 'pry'
require_relative 'song'
class Artist
    attr_accessor :name, :songs
    
    @@all = []

    def initialize(name)
        @name = name
        @@all << self if !@@all.include?(name)
    end

    def self.all
        @@all.uniq
    end

    def songs
        Song.all.select {|s| s.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        found = @@all.find {|a| a.name == name}
        
        if found.nil?
            artist = self.new(name)
            artist
        else
            found
        end
    end

    def print_songs
        Song.all.each do |s|
            puts s.name if s.artist == self
        end
    end
end

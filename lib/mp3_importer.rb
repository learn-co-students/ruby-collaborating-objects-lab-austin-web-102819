require 'pry'
require_relative 'song'

class MP3Importer
    attr_accessor :path

    @@files = []
    def initialize(test_music_path)
        @path = test_music_path

        arr = []
        Dir.glob("#{@path}/*.mp3").each do |file| 
            arr << file.gsub("#{@path}/", "") 
        end
        @@files = arr
    end

    def files
        @@files
    end

    def import
        @@files.each do |f|
            Song.new_by_filename(f)
        end
    end
end
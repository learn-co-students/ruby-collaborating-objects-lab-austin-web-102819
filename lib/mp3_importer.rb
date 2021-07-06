require_relative "song.rb"

class MP3Importer

    attr_accessor :path
    
    @@files = []

    def initialize(folder_path)
        @path = folder_path
        # puts @path
        # Dir.chdir(@path)
        files = []
        file_names = Dir.glob("#{@path}/*.mp3")
        file_names.each{|file_name| files.push(file_name.gsub("#{@path}/", ''))}
        @@files = files
    end

    def files
        @@files
        # puts files.include?("Action Bronson - Larry Csonka - indie.mp3")
    end
    
    def import
        @@files.each{|file| Song.new_by_filename(file)}
    end
    
end
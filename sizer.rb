require 'pry'

# Sizer analyses folders
class Sizer
  attr_accessor :file_sizes
  
  def initialize
    @init_dir = Dir.pwd
    @file_sizes = []
    @temp_path = "#{@init_dir}"

    # get all sub folders
    entries = Dir.entries(@temp_path)
    folders = entries.select do |e| 
      File.directory?("#{@temp_path}/#{e.downcase}") && e[0] != '.'
    end

    loop(folders)  
  end

  def loop(folders)
    folders.each do |folder|
      @file_sizes << folder
      @temp_path = "#{@temp_path}/#{folder}"
      analyse(folder) unless folder[0] == '.'
    end
    @temp_path = @temp_path.split("/")[0..-2].join("/")
  end

  def analyse(folder)
    sub_folders = Dir.entries(@temp_path).reject { |e| e[0] == '.'}
    has_entries = sub_folders.any?
    loop(sub_folders)
  end
end


sizer = Sizer.new

puts "sizer"
p sizer




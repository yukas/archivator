require_relative "decompressor"
require_relative "compressor"

class Archivator  
  
  def initialize
    @letters = []
    @file = ARGV[0]
  end

  def text_archives_or_unzip
    select_archive_or_unzip
    break_up_the_text_with_the_letters

    output_to_file
  end
  
  private
  
  attr_reader :letters, :file

  def select_archive_or_unzip    
    @file = ARGV[1] if ARGV[0] == "-u"         
  end
  
  def break_up_the_text_with_the_letters
    # @text_to_compress = File.read(file)
    
    File.open(file) do |review_file|
      @letters = review_file.read.chars        
    end
  end
  
  def output_to_file
    if ARGV[0] == "-u"
      File.open(ARGV[2], "w") {|file| file.write DeCompressor.new.shapes_from_archive_file(letters)}
    else 
      File.open(ARGV[1], "w") {|file| file.write Compressor.new.creates_archive(letters)}
    end
  end
end

Archivator.new.text_archives_or_unzip

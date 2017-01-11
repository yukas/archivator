require_relative "unzip"
require_relative "archivator"

class Printer
  attr_reader :compressed_text
  attr_reader :letters
  attr_reader :identifier
  attr_reader :uncompressed_text

  def initialize
    @letters = []
    @compressed_text = []
    @identifier = 28.chr
    @uncompressed_text = []
  end

  def text_archives_or_unzip
    break_up_the_text_with_the_letters

    if ARGV[0] == "-u" 
      @uncompressed_text = Unzip.new.shapes_from_archive_file(letters, identifier)
    else 
      @compressed_text = Archivator.new.creates_archive(letters,identifier)
    end

  output_to_file
  end

  def break_up_the_text_with_the_letters
    
    if ARGV[0] == "-u" 
      File.open(ARGV[1]) do |review_file|
        @letters = review_file.read.chars        
      end
    else
      File.open(ARGV[0]) do |review_file|
        @letters = review_file.read.chars       
      end
    end
  end  

  def output_to_file
    if ARGV[0] == "-u"
      File.open(ARGV[2], "w") {|file| file.write uncompressed_text}
    else 
      File.open(ARGV[1], "w") {|file| file.write compressed_text}
    end
  end
end

Printer.new.text_archives_or_unzip
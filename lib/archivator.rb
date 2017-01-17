require_relative "compressor"
require_relative "decompressor"

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
  
  attr_reader :letters, :file, :compressed_or_decompressed_text

  def select_archive_or_unzip    
    @file = ARGV[1] if ARGV[0] == "-u"
  end
  
  def break_up_the_text_with_the_letters
    File.open(file) do |review_file|
      @letters = review_file.read.chars        
    end
  end
  
  def compress_or_decompress
    @compressed_or_decompressed_text = 
      if ARGV[0] != "-u"
        compressor.creates_archive(letters)
      else
        decompressor.shapes_from_archive_file(letters)
      end
  end
  
  def output_to_file
    if ARGV[0] != "-u"
      File.open(ARGV[1], "w") { |file| compressed_or_decompressed_text) }      
    else
      File.open(ARGV[2], "w") { |file| compressed_or_decompressed_text }
    end
  end
  
  def compressor
    @compressor ||= Compressor.new
  end
  
  def decompressor
    @compressor ||= Decompressor.new
  end
end

Archivator.new.text_archives_or_unzip

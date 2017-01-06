class Archivator
  attr_reader :compressed_text
  attr_reader :array
  attr_reader :identifier
  attr_reader :uncompressed_text

  def initialize
    @array = []
    @compressed_text = []
    @identifier = 28.chr
    @uncompressed_text = []
  end

  def text_archives_or_unzip
    break_up_the_text_with_the_letters

    if ARGV[0] == "-u" 
      shapes_from_archive_file
    else 
      creates_archive
    end

  output_to_file
  end

  def break_up_the_text_with_the_letters
    lines = []

    if ARGV[0] == "-u" 
      file = File.open(ARGV[1]) do |review_file|
        lines = review_file.read.chars
        lines.each {|a| array << a}
      end
    else
      file = File.open(ARGV[0]) do |review_file|
        lines = review_file.read.chars
        lines.each {|a| array << a}
      end
    end
  end

  def creates_archive  
    index = 0
    number_of_letters = 1
    
    while index < array.length 
      if array[index] != array[index + 1] && number_of_letters == 1
        compressed_text.push(array[index])
        number_of_letters = 1
      elsif array[index] == array[index + 1]
        number_of_letters += 1
      elsif array[index] != array[index + 1] 
        compressed_text.push(identifier + number_of_letters.to_s + identifier + array[index].to_s)
        number_of_letters = 1
      end

    index += 1
    end
  end

  def shapes_from_archive_file
    index = 0
    number_of_repeats = []

    while index < array.length
      if array[index] == identifier

        while array[index + 1] != identifier
          number_of_repeats.push(array[index + 1])
          transition_to_next_letter = index + 1
              
          index += 1
        end

        uncompressed_text.push(array[transition_to_next_letter + 2].to_s * number_of_repeats.join.to_i)
        index = transition_to_next_letter + 2
        number_of_repeats = []
      else
        uncompressed_text.push(array[index])
      end

      index += 1
    end
  end

  def output_to_file
    if ARGV[0] == "-u"
      File.open(ARGV[2], "w") {|file| file.write uncompressed_text.join}
    else 
      File.open(ARGV[1], "w") {|file| file.write compressed_text.join}
    end
  end
end

archivator = Archivator.new
archivator.text_archives_or_unzip
 
 

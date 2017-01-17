class DeCompressor
  attr_reader :uncompressed_text, :number_of_repeats, :identifier
  
  def initialize
    @uncompressed_text = []
    @number_of_repeats = []
    @identifier = 28.chr
  end
  
  def shapes_from_archive_file(letters)
    index = 0
    number_of_repeats = []

    while index < letters.length
      if letters[index] == identifier
        while letters[index + 1] != identifier
          number_of_repeats.push(letters[index + 1])
          transition_to_next_letter = index + 1
              
          index += 1
        end

        uncompressed_text.push(letters[transition_to_next_letter + 2].to_s * number_of_repeats.join.to_i)
        index = transition_to_next_letter + 2
        number_of_repeats = []
      else
        uncompressed_text.push(letters[index])
      end

      index += 1
    end
    @uncompressed_text = uncompressed_text.join
  end
end

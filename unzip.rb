class Unzip
  attr_reader :uncompressed_text, :number_of_repeats
  
  def initialize    
    @uncompressed_text = []
    @number_of_repeats = []
  end
  
  def shapes_from_archive_file(array, identifier)
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
    @uncompressed_text = uncompressed_text.join
  end
end
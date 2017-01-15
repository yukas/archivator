class Compressor
  attr_reader :compressed_text, :identifier
  
  def initialize    
    @compressed_text = []
    @identifier = 28.chr    
  end

  def creates_archive(letters)  
    index = 0
    number_of_letters = 1
    
    while index < letters.length 
      if letters[index] != letters[index + 1] && number_of_letters == 1
        compressed_text.push(letters[index])
        number_of_letters = 1
      elsif letters[index] == letters[index + 1]
        number_of_letters += 1
      elsif letters[index] != letters[index + 1] 
        compressed_text.push(identifier + number_of_letters.to_s + identifier + letters[index].to_s)
        number_of_letters = 1
      end

      index += 1
    end
    
    @compressed_text = compressed_text.join
  end
end

  
 

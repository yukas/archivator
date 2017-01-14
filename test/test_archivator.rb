require "minitest/autorun"
require "archivator"

class TestArchivator < Minitest::Test
  
  def setup
    @archivator = Archivator.new
  end
  
  
  def test_1    
    archived_string = @archivator.creates_archive(["a", "a", "a", "a"])
    
    assert_equal "\x1C4\x1Ca", archived_string
  end
  
  def test_2    
    archived_string = @archivator.creates_archive(["b", "b", "b", "a"])
    
    assert_equal "\x1C3\x1Cba", archived_string
  end
  
  def test_3    
    archived_string = @archivator.creates_archive(["b", "b", "b", "b", "b", " ", "a", "a"])
    
    assert_equal "\x1C5\x1Cb \x1C2\x1Ca", archived_string
  end
end


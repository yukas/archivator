require "minitest/autorun"
require "unzip"

class TestArchivator < Minitest::Test
  
  def setup
    @unzip = Unzip.new
  end
  
  
  def test_1    
    unarchive_line = @unzip.shapes_from_archive_file(["\x1C", 5, "\x1C", "b", " ", "\x1C", 2, "\x1C", "a"])
    
    assert_equal "bbbbb aa", unarchive_line
  end
  
  def test_2    
    unarchive_line = @unzip.shapes_from_archive_file(["\x1C", 3, "\x1C", "a"])
    
    assert_equal "aaa", unarchive_line
  end
  
  def test_3    
    unarchive_line = @unzip.shapes_from_archive_file(["\x1C", 6, "\x1C", "k"])
    
    assert_equal "kkkkkk", unarchive_line
  end
end


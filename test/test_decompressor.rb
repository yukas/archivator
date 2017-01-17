require "minitest/autorun"
require "decompressor"

class TestDeCompressor < Minitest::Test
  def setup
    @unzip = DeCompressor.new
  end

  def test_decompression_5b_2a_in_bbbbb_aa
    decompressible_line = @unzip.shapes_from_archive_file(["\x1C", 5, "\x1C", "b", " ", "\x1C", 2, "\x1C", "a"])
    
    assert_equal "bbbbb aa", decompressible_line
  end
  
  def test_compression_3a_in_aaa
    decompressible_line = @unzip.shapes_from_archive_file(["\x1C", 3, "\x1C", "a"])
    
    assert_equal "aaa", decompressible_line
  end
  
  def test_compression_6k_in_kkkkkk
    decompressible_line = @unzip.shapes_from_archive_file(["\x1C", 6, "\x1C", "k"])
    
    assert_equal "kkkkkk", decompressible_line
  end
end

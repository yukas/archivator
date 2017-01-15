require "minitest/autorun"
require "compressor"

class TestCompressor < Minitest::Test
  
  def setup
    @compressor = Compressor.new
  end
  
  
  def test_compression_aaaa_in_4a
    compressible_string = @compressor.creates_archive(["a", "a", "a", "a"])
    
    assert_equal "\x1C4\x1Ca", compressible_string
  end
  
  def test_compression_bbba_in_3ba
    compressible_string = @compressor.creates_archive(["b", "b", "b", "a"])
    
    assert_equal "\x1C3\x1Cba", compressible_string
  end
  
  def test_compression_bbbbb_aa_in_5b_2a
    compressible_string = @compressor.creates_archive(["b", "b", "b", "b", "b", " ", "a", "a"])
    
    assert_equal "\x1C5\x1Cb \x1C2\x1Ca", compressible_string
  end
end


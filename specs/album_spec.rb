require("minitest/autorun")
require_relative('../models/album')

class TestAlbum < MiniTest:: Test

  def setup
    options = {"id" => 1, "title" => "Spiderland", "quantity" => 5}
    @album = Album.new(options)
  end

  def test_album_title()
    result = @album.title()
    assert_equal("Spiderland", result)
  end

  def test_quantity()
    result = @album.quantity()
    assert_equal(5, result)
  end
end

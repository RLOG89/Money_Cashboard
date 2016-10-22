require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../tag')

class TestTransaction < MiniTest::Test

  def setup
    options = {
      'name' => "Food",
      'colour' => "Red"
    }
    @tag = Tag.new( options )
  end

  def test_tag_has_name
    assert_equal("Food", @tag.name)
  end

  def test_tag_has_colour
    assert_equal("Red", @tag.colour)
  end

end
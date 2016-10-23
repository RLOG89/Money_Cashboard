require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')
require_relative('../merchant')

class TestTransaction < MiniTest::Test

  def setup
    options = {
      'name' => "Brauhaus"
    }
    @merchant= Merchant.new( options )
  end

  def test_merchant_has_name
    assert_equal("Brauhaus", @merchant.name)
  end

end
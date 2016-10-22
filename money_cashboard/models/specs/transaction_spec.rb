require('minitest/autorun')
require('minitest/rg')
require_relative('../transaction')

class TestTransaction < MiniTest::Test

  def setup
    options = {
      'date' => 22/10/2016,
      'merchant' => "Tesco",
      'description' => "Weekly food shop",
      'amount' => 50
    }
    @transaction = Transaction.new( options )
  end

  def test_transaction_has_date
    assert_equal(22/10/2016, @transaction.date)
  end
end
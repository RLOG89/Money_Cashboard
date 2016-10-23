require('minitest/autorun')
require('minitest/rg')
require('date')
require_relative('../transaction')

class TestTransaction < MiniTest::Test

  def setup
    options = {
      'date' => 22/10/2016,
      'merchant' => "Tesco",
      'description' => "Weekly food shop",
      'amount' => 51.50
    }

    @transaction = Transaction.new( options )

  end

  def test_transaction_has_date
    assert_equal(22/10/2016, @transaction.date)
  end

  def test_transaction_has_merchant
    assert_equal("Tesco", @transaction.merchant)
  end

  def test_transaction_has_description
    assert_equal("Weekly food shop", @transaction.description)
  end

  def test_transaction_has_amount
    assert_equal(51.50, @transaction.amount)
  end

end
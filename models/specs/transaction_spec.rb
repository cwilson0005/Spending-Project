require("minitest/autorun")
require_relative("../transaction")

class TestTransaction < MiniTest::Test

  def setup
    options = {
      'amount' => '25.00'
    }

    @transaction = Transaction.new(options)
  end

  def test_amount()
    result = @transaction.amount()
    assert_equal(25.00, result)
  end

end

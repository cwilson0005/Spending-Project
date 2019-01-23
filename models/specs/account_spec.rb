require("minitest/autorun")
require_relative("../account")

class TestAccount < MiniTest::Test

  def setup
    options = {
      'first_name' => 'Conor',
      'sur_name' => 'Wilson',
      'budget' => '100.00'
    }

    @account = Account.new(options)
  end

  def test_first_name()
    result = @account.first_name()
    assert_equal("Conor", result)
  end

  def test_sur_name()
    result = @account.sur_name()
    assert_equal("Wilson", result)
  end

  def test_format_name()
    result = @account.format_name()
    assert_equal("Conor Wilson", result)
  end

  def test_budget()
    result = @account.budget()
    assert_equal(100.00, result)
  end

end

require("minitest/autorun")
require_relative("../merchant")

class TestMerchant < MiniTest::Test

  def setup
    options = {
      'name' => 'Tesco'
    }

    @merchant = Merchant.new(options)
  end

  def test_name()
    result = @merchant.name()
    assert_equal("Tesco", result)
  end

end

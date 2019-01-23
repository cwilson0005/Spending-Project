require("minitest/autorun")
require_relative("../tag")

class TestTag < MiniTest::Test

  def setup
    options = {
      'name' => 'groceries'
    }

    @tag = Tag.new(options)
  end

  def test_name()
    result = @tag.name()
    assert_equal("groceries", result)
  end

end

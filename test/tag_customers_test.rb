require 'minitest/autorun'
require 'tag_customers'

class TestTagCustomers < Minitest::Test

  def test_truth
    assert true
  end

  def test_loaded_file
    assert TagCustomers
  end
end

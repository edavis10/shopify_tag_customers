require 'minitest/autorun'
require 'tag_customers'

class TestTagCustomers < Minitest::Test

  def test_truth
    assert true
  end

  def test_loaded_file
    assert TagCustomers
  end

  def test_connection
    connection_test = TagCustomers.new.test_connection
    assert connection_test
    assert_equal "#{ENV['SHOP']}.myshopify.com", connection_test.domain
  end
end

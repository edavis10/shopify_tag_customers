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

  def test_customers
    customers = TagCustomers.new.customers
    assert customers
    assert_equal 4, customers.length # Will be different depending on your shop data
  end

  def test_tag_repeat_customers
    customers = TagCustomers.new.tag_repeat_customers
    assert customers
    assert_equal 1, customers.length # Will be different depending on your shop data
    customers.each do |customer|
      assert_includes customer.tags, "repeat"
    end
  end
end

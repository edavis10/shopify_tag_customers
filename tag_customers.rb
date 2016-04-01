#!/usr/bin/env ruby
require 'pry'
require 'shopify_api'
require 'dotenv'
Dotenv.load

class TagCustomers
  attr_accessor :shop_url

  # Configure the Shopify connection
  def initialize
    @shop_url = "https://#{ENV["SHOPIFY_API_KEY"]}:#{ENV["SHOPIFY_PASSWORD"]}@#{ENV["SHOP"]}.myshopify.com/admin"
    ShopifyAPI::Base.site = @shop_url
  end

  # Tests the Shopify connection with a simple GET request
  def test_connection
    return ShopifyAPI::Shop.current
  end

  # Downloads the customers from Shopify
  def customers
    ShopifyAPI::Customer.all
  end

  # Tags repeat customers with the tag "repeat"
  def tag_repeat_customers
    tagged_customers = []
    customers.each do |customer|
      if customer.orders_count > 1
        unless customer.tags.include?("repeat")
          customer.tags += "repeat"
          customer.save
        end
        tagged_customers << customer
      end
    end

    tagged_customers
  end
end

# Called when the file is run on the command line, but not in a require
if __FILE__ == $PROGRAM_NAME
  tagged = TagCustomers.new.tag_repeat_customers
  puts "Tagged #{tagged.length} customers with 'repeat'"
end

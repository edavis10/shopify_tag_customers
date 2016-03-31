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
end

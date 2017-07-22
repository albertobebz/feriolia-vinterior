require_relative "checkout.rb"

class CheckoutTest

  PROMOTIONAL_RULES = [
    {type: :total, amount: 60, discount: 0.1},
    {type: :product, code: 001, amount: 2, price: 8.5}
  ]

  def self.run
    test [001,002,003], "£66.78"
    test [001,003,001], "£36.95"
    test [001,002,001,003], "£73.76"
  end

  def self.test(basket, expected_price, promotional_rules=PROMOTIONAL_RULES)
    co = Checkout.new(promotional_rules)
    basket.each do |item|
      co.scan(item)
    end
    price = co.total
    if price == expected_price
      puts "test ok"
    else
      raise "price expected to be #{expected_price}, got #{price} instead"
    end
  end

end

CheckoutTest.run

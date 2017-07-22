class Checkout

  PRODUCTS = [
    {code: 001, name: 'Very Cheap Chair', price: 9.25},
    {code: 002, name: 'Little table', price: 45},
    {code: 003, name: 'Funky light', price: 19.95}
  ]

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @subtotal = 0
    @basket = []
  end

  def scan(item)
    if PRODUCTS.select{|p| p[:code] ==item}.any?
      @basket << item
    else
      raise 'Item not found'
    end
  end

  def item_price(code)
    existing_promotion = @promotional_rules.select{|promotion| promotion[:type] == :product && promotion[:code] == code}.first
    if existing_promotion && @basket.count(code) >= existing_promotion[:amount]
      existing_promotion[:price]
    else
      PRODUCTS.select{|p| p[:code] == code}.first[:price]
    end
  end

  def total
    @subtotal = @basket.inject(0){|tot, code| tot += item_price(code); tot}
    total_promotion = @promotional_rules.select{|promotion| promotion[:type] == :total && @subtotal >= promotion[:amount]}.first
    if total_promotion
      "£#{(@subtotal - @subtotal * total_promotion[:discount]).round(2)}"
    else
      "£#{@subtotal}"
    end
  end

end

# Tests

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

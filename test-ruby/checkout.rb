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

end

# Tests

class CheckoutTest

  PROMOTIONAL_RULES = [
    {type: :total, amount: 60, discount: 0.1},
    {type: :product, code: 001, amount: 2, price: 8.5}
  ]

end

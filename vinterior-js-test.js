function Checkout(promotionType) {
  this.promotionType = promotionType;
  this.subtotal = 0;
  this.basket = [];
}

Checkout.prototype = {

  add: function(itemCost) {
    this.subTotal += itemCost;
  }

}

function Checkout(promotionType) {
  this.promotionType = promotionType;
  this.subtotal = 0;
  this.basket = [];
}

Checkout.prototype = {

  add: function(itemCost) {
    this.subTotal += itemCost;
  },

  scan: function(item, qty) {
    var qty = qty || 1;
    for(var i = 0; i < qty; i++) {
      this.basket.push(item);
    }
    if(item === "001"){ qty >= 2 ? this.add(8.50 * qty) : this.add(9.25 * qty); }
    else if(item === "002"){this.add(45.00 * qty)}
    else if(item === "003"){this.add(19.95 * qty)}
    else{console.log('Item not found')};
  },

}

// ****USE OF THE INTERFACE**** //

// Create a 'co' instance
var co = new Checkout('promotionType');
// Scan items
co.scan('001');
co.scan('002', 2);

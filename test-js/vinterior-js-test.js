function Checkout(promotionType) {
  this.promotionType = promotionType;
  this.subTotal = 0;
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

  total: function() {
    if(this.subTotal >= 60) {
      var discount = (this.subTotal * 10)/100;
      this.subTotal -= discount;
      return this.subTotal;
    } else {
      return this.subTotal;
    }
    console.log(this.subTotal);
  },

  clearTotal: function() {
    this.subTotal = 0;
    this.basket = [];
  }

}

// ****USE OF THE INTERFACE**** //

// Create an instance
var co = new Checkout("promotionType");
// Scan items
co.scan("001");
co.scan("002");
co.scan("003");
// Show the items in the basket
console.log(co.basket);
// Checkout and see the Total
co.total();
// Show the total
console.log('Your total is ' + co.subTotal); // resutl => 66.78

// manual test 2
co.clearTotal();
co.scan("001", 2);
co.scan("003");
console.log(co.basket);
co.total();
console.log('Your total is ' + co.subTotal); // resutl => 36.95

// manual test 3
co.clearTotal();
co.scan("001", 2);
co.scan("002");
co.scan("003");
console.log(co.basket);
co.total();
console.log('Your total is ' + co.subTotal); // resutl => 73.75

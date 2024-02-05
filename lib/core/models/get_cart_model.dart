class GetCartModel {
  dynamic status;
  Data? data;


  GetCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }


}

class Data {
  List<CartItems>? cartItems;
  dynamic total;


  Data.fromJson(Map<String, dynamic> json) {
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add( CartItems.fromJson(v));
      });
    }
    total = json['total'];
  }


}

class CartItems {
  dynamic id;
  Product? product;


  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ?  Product.fromJson(json['product']) : null;
  }

}

class Product {
  dynamic id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  dynamic image;
  dynamic name;
  dynamic inCart;



  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inCart = json['in_cart'];
  }


}

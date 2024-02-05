class SearchModel {
  dynamic status;
  dynamic message;
  Data? data;


  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }


}

class Data {
  List<ProductData>? data;



  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(ProductData.fromJson(v));
      });
    }
  }

}

class ProductData {
  dynamic id;
  dynamic price;
  dynamic image;
  dynamic name;
  dynamic inCart;



  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    image = json['image'];
    name = json['name'];
    inCart = json['in_cart'];
  }

}

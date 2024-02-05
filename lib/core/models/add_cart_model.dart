class AddCartModel {
  dynamic status;
  dynamic message;


  AddCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }


}





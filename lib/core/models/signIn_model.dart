class SignInModel {
  dynamic status;
  dynamic message;
  Data? data;



  SignInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }


}

class Data {
  dynamic id;
  dynamic name;
  dynamic email;
  dynamic phone;
  dynamic image;
  dynamic points;
  dynamic token;


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    token = json['token'];
  }


}

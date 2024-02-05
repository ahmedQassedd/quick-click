class ProfileModel {
  dynamic status;
  Data? data;


  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }


}

class Data {
  dynamic name;
  dynamic email;
  dynamic phone;
  dynamic token;



  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    token = json['token'];
  }

}

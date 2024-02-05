import 'package:dio/dio.dart';

import 'remote/dio_helper.dart';


abstract class Repository {

  Future<Response> signIn({
    required String endPoint ,
    required Map<String , dynamic> data ,
    String? token,
  });


  Future<Response> signUp({
    required String endPoint ,
    required Map<String , dynamic> data ,
    String? token,
  });



  Future<Response> home({
    required String endPoint ,
    required token,
  });


  Future<Response> addCart({
    required String endPoint ,
    required Map<String , dynamic> data ,
    required token,
  });


  Future<Response> getCart({
    required String endPoint ,
    required token,
  });

  Future<Response> search({
    required String endPoint ,
    required Map<String , dynamic> data ,
    required token,
  });

  Future<Response> profile({
    required String endPoint ,
    required token,
  });

  Future<Response> update({
    required String endPoint ,
    required Map<String , dynamic> data ,
    String? token,
  });


}




class RepositoryImpl extends Repository {
  final DioHelper dioHelper ;

  RepositoryImpl({required this.dioHelper });


  @override
  Future<Response> signIn({ required String endPoint , required Map<String , dynamic> data , String? token}) async {

    final response = await dioHelper.postData(endPoint: endPoint , data: data , token: token );

    return response ;

  }


  @override
  Future<Response> signUp({ required String endPoint , required Map<String , dynamic> data , String? token}) async {

    final response = await dioHelper.postData(endPoint: endPoint , data: data , token: token );

    return response ;

  }

  @override
  Future<Response> home({ required String endPoint , required token}) async {

    final response = await dioHelper.getData(endPoint: endPoint , token: token );

    return response ;

  }


  @override
  Future<Response> addCart({required String endPoint, required Map<String, dynamic> data, required token})async {

    final response = await dioHelper.postData(endPoint: endPoint , data: data , token: token );

    return response ;
  }



  @override
  Future<Response> getCart({ required String endPoint , required token}) async {

    final response = await dioHelper.getData(endPoint: endPoint , token: token );

    return response ;

  }

  @override
  Future<Response> search({required String endPoint, required Map<String, dynamic> data, required token})async {

    final response = await dioHelper.postData(endPoint: endPoint , data: data , token: token );

    return response ;

  }

  @override
  Future<Response> profile({ required String endPoint , required token}) async {

    final response = await dioHelper.getData(endPoint: endPoint , token: token );

    return response ;

  }


  @override
  Future<Response> update({ required String endPoint , required Map<String , dynamic> data , String? token}) async {

    final response = await dioHelper.putData(endPoint: endPoint , data: data , token: token );

    return response ;

  }







}
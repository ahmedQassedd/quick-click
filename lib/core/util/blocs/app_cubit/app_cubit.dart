
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_click/core/models/add_cart_model.dart';
import 'package:quick_click/core/models/get_cart_model.dart';
import 'package:quick_click/core/models/home_model.dart';
import 'package:quick_click/core/models/profile_model.dart';
import 'package:quick_click/core/models/search_model.dart';
import 'package:quick_click/core/models/signIn_model.dart';
import 'package:quick_click/core/models/signUp_model.dart';
import 'package:quick_click/core/models/update_model.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_states.dart';
import 'package:quick_click/core/util/const.dart';
import 'package:quick_click/core/util/network/remote/end_points.dart';
import 'package:quick_click/core/util/network/repository.dart';
import 'package:quick_click/features/cart_page/presentation/page/cart_page.dart';
import 'package:quick_click/features/home_page/presentation/page/home_page.dart';



class AppCubit extends Cubit<AppStates> {

  final Repository repository ;



  AppCubit({required this.repository} ) : super(InitState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool secure = true;
  IconData suffixIcon = Icons.visibility_off_outlined;


  Widget? firstPage ;


  int selectedIndex = 0 ;

  void navigateBottomBar(int index){

    selectedIndex = index ;

      getCartMethod(token: token);

    emit(SelectedIndexState());

  }



  List<Widget> pages = [
    HomePage(),
    CartPage(),
  ];








  void hiddenPasswordMethod(){

    secure = !secure;
    suffixIcon = secure ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(HiddenPasswordState());
  }


  SignInModel? signInModel ;


  void signInMethod ({required String email , required String password}) {
    
    emit(LoadingSignInState());
    
    repository.signIn(endPoint: signInEndPoint, data:  {
      'email': email ,
      'password': password ,
    }
    ).then((value) {

      signInModel = SignInModel.fromJson(value.data);

      print(signInModel?.data?.token);



      emit(SuccessSignInState());



    }).catchError((onError){

      print(onError.toString());

      emit(ErrorSignInState());

    });
    
    
  }




  SignUpModel? signUpModel ;


  void signUpMethod ({required String name , required String email , required String password , required String phone}) {

    emit(LoadingSignUpState());

    repository.signUp(endPoint: signUpEndPoint, data:  {
      'name': name ,
      'email': email ,
      'password': password ,
      'phone': phone , }

    ).then((value) {

      signUpModel = SignUpModel.fromJson(value.data);




      emit(SuccessSignUpState());




    }).catchError((onError){

      emit(ErrorSignUpState());

    });


  }


  HomeModel? homeModel ;

  Map<int , bool> inCart = {} ;



  Future<void> homeMethod ({String? token}) async {

    emit(LoadingHomeState());

    repository.home(endPoint: homeEndPoint , token: token
    ).then((value) {

      homeModel = HomeModel.fromJson(value.data);

      homeModel?.data?.products?.forEach((element) {

        inCart.addAll(
            {
              element.id : element.inCart ,
            });

      });





      emit(SuccessHomeState());


    }).catchError((onError){

      emit(ErrorHomeState());

    });
  }





  AddCartModel? addCartModel ;


  void addCartMethod ({required id,  String? token}) {

    inCart[id] = !(inCart[id])! ;

    emit(LoadingAddCartState());

    repository.addCart(endPoint: cartEndPoint,
      token: token,
      data:  {
      'product_id': id } ,

    ).then((value) {

      addCartModel = AddCartModel.fromJson(value.data);

      if(!(addCartModel!.status!)){

        inCart[id] = !(inCart[id])! ;

      }

      getCartMethod(token: token);
      homeMethod(token: token);


      emit(SuccessAddCartState());



    }).catchError((onError){

      inCart[id] = !(inCart[id])! ;

      emit(ErrorAddCartState());

    });


  }











  GetCartModel? getCartModel ;


  void getCartMethod ({String? token}) {


    emit(LoadingGetCartState());

    repository.getCart(endPoint: cartEndPoint,
      token: token,

    ).then((value) {

      getCartModel = GetCartModel.fromJson(value.data);



      emit(SuccessGetCartState());



    }).catchError((onError){


      emit(ErrorGetCartState());

    });


  }




  SearchModel? searchModel ;


  void searchMethod ({required text,  String? token}) {


    emit(LoadingSearchState());

    repository.search(endPoint: searchEndPoint,
      token: token,
      data:  {
        'text': text } ,

    ).then((value) {

      searchModel = SearchModel.fromJson(value.data);


      emit(SuccessSearchState());


    }).catchError((onError){

      print(onError);

      emit(ErrorSearchState());

    });


  }


  ProfileModel? profileModel ;


  void profileMethod ({ String? token}) {


    emit(LoadingProfileState());

    repository.profile(endPoint: profileEndPoint,
      token: token,

    ).then((value) {

      profileModel = ProfileModel.fromJson(value.data);



      emit(SuccessProfileState());



    }).catchError((onError){


      emit(ErrorProfileState());

    });


  }



  UpdateModel? updateModel ;


  void updateMethod ({required String name , required String email , required String phone }) {

    emit(LoadingUpdateState());

    repository.update(endPoint: updateEndPoint , token: token , data:  {
      'name': name ,
      'phone': phone ,
      'email': email ,
      'image': ''
    }
    ).then((value) {

      updateModel = UpdateModel.fromJson(value.data);

      profileMethod(token: token);


      emit(SuccessUpdateState());



    }).catchError((onError){

      print(onError.toString());

      emit(ErrorUpdateState());

    });


  }



  }

















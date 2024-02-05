import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_states.dart';
import 'package:quick_click/core/util/const.dart';
import 'package:quick_click/core/util/widgets/button.dart';
import 'package:quick_click/core/util/widgets/navigate_and_finish.dart';
import 'package:quick_click/core/util/widgets/text_form_field.dart';
import 'package:quick_click/features/drawer_page/presentation/page/drawer_page.dart';

var nameController = TextEditingController();
var emailController = TextEditingController();
var phoneController = TextEditingController();
var signUpFormKey = GlobalKey<FormState>();



AppBar mainAppBarForProfile(context) => AppBar(
  centerTitle: true,
  leading: Padding(
      padding: const EdgeInsetsDirectional.all(5),
      child: InkWell(
onTap: (){

  AppCubit.get(context).selectedIndex = 0 ;


  navigateAndFinish(context: context, widget: DrawerPage(), pageTransitionType: PageTransitionType.leftToRight);

  },
child: Container(height: 40 ,decoration: BoxDecoration(color: Colors.black.withOpacity(0.3) , borderRadius: BorderRadiusDirectional.circular(10)), child:  const Icon(Icons.arrow_back_ios_new_outlined , color: Colors.white, size: 18,),)),
  ),
title: const Text('Update Profile' , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),),
  backgroundColor: primaryColor,

);

Widget mainWidgetForProfilePage({state, context}) =>   Center(
  child:   Padding(
    padding: const EdgeInsetsDirectional.only(top: 20, start: 20 , end: 20 , bottom: 100),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: signUpFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
              child:   Column(

                children: [

                  defaultTextFormField(
                      context: context,
                      controller: nameController,
                      inputType: TextInputType.name,
                      hint: 'Name',
                      validator: (value){

                        if(value!.isEmpty){

                          return 'Please Enter Your Name!' ;

                        }
                      }),

                  const SizedBox(height: 15,),

                  defaultTextFormField(
                      context: context,
                      controller: emailController,
                      inputType: TextInputType.emailAddress,
                      hint: 'Email',
                      validator: (value){

                        if(value!.isEmpty){

                          return 'Please Enter Your Email!' ;

                        }
                      }),



                  const SizedBox(height: 15,),


                  defaultTextFormField(
                      context: context,
                      controller: phoneController,
                      inputType: TextInputType.phone,
                      hint: 'Phone Number',
                      validator: (value){

                        if(value!.isEmpty){

                          return 'Please Enter Your Phone!' ;

                        }
                      }),

                  const SizedBox(height: 70,),


                  ConditionalBuilder(
                      condition: state is LoadingUpdateState,
                      builder: (context) => const CircularProgressIndicator(color: Colors.black,),
                      fallback: (context) => ConditionalBuilder(
                        condition: state is LoadingSignUpState || state is ErrorSignUpState,
                        builder: (context)=> const CircularProgressIndicator(color: Colors.black,),
                        fallback: (context)=> customButton(
                            text: 'Save Changes',
                            color: Colors.black,
                            onPressed: (){

                              FocusManager.instance.primaryFocus?.unfocus();


                              if(signUpFormKey.currentState!.validate()){

                                AppCubit.get(context).updateMethod(
                                    name: nameController.text ,
                                    email: emailController.text,
                                    phone: phoneController.text);
                              }

                            }


                        ),
                        ),

                  ),

                ],),


            )

          ],
        ),
      ),
    ),
  ),
);
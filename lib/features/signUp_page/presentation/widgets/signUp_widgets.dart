
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_states.dart';
import 'package:quick_click/core/util/widgets/button.dart';
import 'package:quick_click/core/util/widgets/text_form_field.dart';

var nameController = TextEditingController();
var emailControllers = TextEditingController();
var passwordController = TextEditingController();
var phoneController = TextEditingController();
var signUpFormKey = GlobalKey<FormState>();

Widget mainWidgetForSignUpPage({state, context}) =>   SafeArea(
  child: Padding(
    padding: const EdgeInsetsDirectional.all(20),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: signUpFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            InkWell(
                onTap: (){Navigator.pop(context);},
                child: Container( height: 47 , width: 50 ,decoration: BoxDecoration(color: Colors.black.withOpacity(0.3) , borderRadius: BorderRadiusDirectional.circular(10)), child:  const Icon(Icons.arrow_back_ios_new_outlined , color: Colors.white, size: 18,),)),
            Column(children: [

              SizedBox(
                  height: 200,
                  width: double.infinity ,
                  child: Image.asset('assets/icon_logo.png')),



            ],),

            const SizedBox(

              height: 30,

            ),

            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Column(

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

                              const SizedBox(height: 10,),

                              defaultTextFormField(
                                  context: context,
                                  controller: emailControllers,
                                  inputType: TextInputType.emailAddress,
                                  hint: 'Email',
                                  validator: (value){

                                    if(value!.isEmpty){

                                      return 'Please Enter Your Email!' ;

                                    }
                                  }),



                              const SizedBox(height: 10,),


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


                              const SizedBox(height: 10,),

                              defaultTextFormField(
                                  context: context,
                                  controller: passwordController,
                                  inputType: TextInputType.visiblePassword,
                                  hint: 'Create a Password',
                                  secure: AppCubit.get(context).secure,
                                  suffixIcon: AppCubit.get(context).suffixIcon,
                                  suffixPressed: (){
                                    AppCubit.get(context).hiddenPasswordMethod();
                                  },
                                  validator: (value){

                                    if(value!.isEmpty){

                                      return 'Please Enter Your Password!' ;

                                    }
                                  }),



                            ],),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30,),


                    ConditionalBuilder(
                      condition: state is LoadingSignUpState || state is ErrorSignUpState,
                      builder: (context)=> const CircularProgressIndicator(color: Colors.black,),
                      fallback: (context)=> customButton(
                          text: 'Sign Up',
                          color: Colors.black,
                          onPressed: (){

                            FocusManager.instance.primaryFocus?.unfocus();


                            if(signUpFormKey.currentState!.validate()){


                              AppCubit.get(context).signUpMethod(name: nameController.text, email: emailControllers.text, password: passwordController.text, phone: phoneController.text);

                            }

                          }


                      ),),




                  ],),
              ),
            )

          ],
        ),
      ),
    ),
  ),

);

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_states.dart';
import 'package:quick_click/core/util/widgets/button.dart';
import 'package:quick_click/core/util/widgets/navigete_to.dart';
import 'package:quick_click/core/util/widgets/text_form_field.dart';
import 'package:quick_click/features/signUp_page/presentation/page/signUp_page.dart';


var passwordController = TextEditingController();
var emailControllers = TextEditingController();
var signInFormKey = GlobalKey<FormState>();

Widget mainWidgetForSignInPage({state, context}) =>   SafeArea(
  child: Padding(
    padding: const EdgeInsetsDirectional.all(20),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: signInFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Column(children: [

              SizedBox(
                  height: 200,
                  width: double.infinity ,
                  child: Image.asset('assets/icon_logo.png')),

              Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 20),
                  child: Text('Welcome Back, We Missed You!' , style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black38),)),


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
                                    controller: passwordController,
                                    inputType: TextInputType.visiblePassword,
                                    hint: 'Password',
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
                          condition: state is LoadingSignInState || state is ErrorSignInState,
                          builder: (context)=> const CircularProgressIndicator(color: Colors.black,),
                          fallback: (context)=> customButton(
                              text: 'Sign In',
                              color: Colors.black,
                              onPressed: (){

                                FocusManager.instance.primaryFocus?.unfocus();

                                if(signInFormKey.currentState!.validate()){

                                  AppCubit.get(context).signInMethod(email: emailControllers.text, password: passwordController.text);



                                }


                              }),),

                      const SizedBox(height: 10,),

                      TextButton(onPressed: (){

                        navigateTo(context: context, widget: SignUpPage() , pageTransitionType: PageTransitionType.rightToLeftWithFade);

                      }, child:  Text('Create a new account' , style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.blueAccent) ,))
                    ],),
                  ),
                )

            ],
        ),
      ),
    ),
    ),

);
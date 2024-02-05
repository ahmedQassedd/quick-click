import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_states.dart';
import 'package:quick_click/core/util/network/local/cache_helper.dart';
import 'package:quick_click/core/util/widgets/navigate_and_finish.dart';
import 'package:quick_click/features/signIn_page/presentation/page/signIn_page.dart';
import 'package:quick_click/features/signIn_page/presentation/widgets/signIn_widgets.dart';
import 'package:quick_click/features/update_profile_page/presentation/page/update_profile_page.dart';


class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return  Scaffold(
            backgroundColor: const Color(0xFF404040),
            //backgroundColor:  Colors.blue,
            body: SafeArea (
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Column(children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(55),
                              image: const DecorationImage(
                                image: AssetImage('assets/user.jpg'),
                              ),
                            ),

                          ),

                        ],),
                      const SizedBox(height: 10,),
                      Text(' ${AppCubit.get(context).profileModel?.data?.email}' , overflow: TextOverflow.ellipsis  ,style: Theme.of(context).textTheme.bodyMedium!.copyWith( color:  Colors.white , fontWeight: FontWeight.bold),),

                      const SizedBox(height: 70,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const SizedBox(height: 30,),

                        InkWell(
                          onTap: (){

                            ZoomDrawer.of(context)!.close();

                            navigateAndFinish(context: context, widget: UpdateProfilePage(), pageTransitionType: PageTransitionType.rightToLeft);

                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.person_pin_outlined , color:  Colors.white , size: 20,),
                              const SizedBox(width: 6,),
                              Text('Profile' , overflow: TextOverflow.ellipsis  ,style: Theme.of(context).textTheme.bodyMedium!.copyWith( color:  Colors.white , fontWeight: FontWeight.bold),),
                            ],),
                        ),

                        const SizedBox(height: 25,),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.settings_outlined , color:  Colors.white , size: 20,),
                            const SizedBox(width: 6,),
                            Text('Settings' , overflow: TextOverflow.ellipsis  , style: Theme.of(context).textTheme.bodyMedium!.copyWith( color:  Colors.white , fontWeight: FontWeight.bold),),
                          ],),

                        const SizedBox(height: 25,),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.support_agent_outlined , color:  Colors.white , size: 20,),
                            const SizedBox(width: 6,),
                            Text('Support' , overflow: TextOverflow.ellipsis  , style: Theme.of(context).textTheme.bodyMedium!.copyWith( color:  Colors.white , fontWeight: FontWeight.bold),),
                          ],),


                        const SizedBox(height: 25,),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.info_outline , color:  Colors.white , size: 20,),
                            const SizedBox(width: 6,),
                            Text('About US' , overflow: TextOverflow.ellipsis  , style: Theme.of(context).textTheme.bodyMedium!.copyWith( color:  Colors.white , fontWeight: FontWeight.bold),),
                          ],),
                      ],),

                    ],),

                    InkWell(
                      onTap: (){

                        CacheHelper.removeData(key: 'token')?.then((value) {

                          emailControllers.text = '' ;
                          passwordController.text = '' ;

                          navigateAndFinish(context: context, widget: SignInPage() , pageTransitionType: PageTransitionType.bottomToTop);

                        });

                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.logout_outlined , color:  Colors.white , size: 18,),
                          const SizedBox(width: 6,),
                          Text('LOGOUT' , overflow: TextOverflow.ellipsis  , style: Theme.of(context).textTheme.bodySmall!.copyWith( color:  Colors.white , fontWeight: FontWeight.bold),),
                        ],),
                    ),

                ],),
              ),
            )
        );
      },
    );
  }
}





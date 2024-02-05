
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_states.dart';
import 'package:quick_click/core/util/const.dart';
import 'package:quick_click/core/util/network/local/cache_helper.dart';
import 'package:quick_click/features/drawer_page/presentation/page/drawer_page.dart';
import 'package:quick_click/features/layout_page/presentation/page/layout_page.dart';
import 'package:quick_click/features/signUp_page/presentation/widgets/signUp_widgets.dart';

import '../../../../core/util/widgets/navigate_and_finish.dart';


class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {

        if(state is SuccessSignUpState) {

          token = AppCubit.get(context).signUpModel?.data?.token ;
          AppCubit.get(context).selectedIndex = 0 ;
          AppCubit.get(context).homeMethod(token: token );
          AppCubit.get(context).getCartMethod(token: token );
          AppCubit.get(context).profileMethod(token: token );

          CacheHelper.saveData(key: 'token', value: AppCubit.get(context).signUpModel?.data?.token).then((value) {

            navigateAndFinish(context: context, widget: DrawerPage(), pageTransitionType: PageTransitionType.leftToRight);


          });

        }


      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: primaryColor,
            body: mainWidgetForSignUpPage(context: context , state: state),
        );
      },
    );
  }
}

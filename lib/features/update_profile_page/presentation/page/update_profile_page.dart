import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_states.dart';
import 'package:quick_click/core/util/const.dart';
import 'package:quick_click/core/util/widgets/navigate_and_finish.dart';
import 'package:quick_click/core/util/widgets/show_toast.dart';
import 'package:quick_click/features/drawer_page/presentation/page/drawer_page.dart';
import 'package:quick_click/features/update_profile_page/presentation/widgets/update_profile_widgets.dart';



class UpdateProfilePage extends StatelessWidget {
  UpdateProfilePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {

        if(state is SuccessUpdateState && AppCubit.get(context).updateModel?.status){
          AppCubit.get(context).selectedIndex = 0 ;
          showToast(text: 'Updated Successfully');
          navigateAndFinish(context: context, widget: DrawerPage(), pageTransitionType: PageTransitionType.leftToRight);
        }
        else if (!AppCubit.get(context).updateModel?.status || state is ErrorUpdateState){

          showToast(text: 'Updated Not Successfully' , );

        }

      },
      builder: (context, state) {

        nameController.text = AppCubit.get(context).profileModel?.data?.name ;
        emailController.text = AppCubit.get(context).profileModel?.data?.email ;
        phoneController.text = AppCubit.get(context).profileModel?.data?.phone ;

        return Scaffold(
            backgroundColor: primaryColor,
            appBar: mainAppBarForProfile(context),
            body: mainWidgetForProfilePage(context: context , state: state ),
        );
      },
    );
  }
}

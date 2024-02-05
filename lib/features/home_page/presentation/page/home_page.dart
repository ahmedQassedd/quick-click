
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_states.dart';
import 'package:quick_click/core/util/const.dart';
import 'package:quick_click/core/util/widgets/show_toast.dart';
import 'package:quick_click/features/home_page/presentation/widgets/home_widgets.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {

        if(state is ErrorAddCartState){
          showToast(text: 'Connection Error!');
        }
        else if(state is SuccessAddCartState){
          showToast(text: AppCubit.get(context).addCartModel?.message);
        }

      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: primaryColor,
          body: ConditionalBuilder(
                condition: AppCubit.get(context).homeModel?.data?.products?[0].id == null || state is LoadingHomeState || state is SuccessSignInState || state is SuccessSignUpState,
                builder: (context) => const Center(child: CircularProgressIndicator(color: Colors.black,)),
                fallback: (context) => mainWidgetForHome(context)) ,
        );
      },
    );
  }
}

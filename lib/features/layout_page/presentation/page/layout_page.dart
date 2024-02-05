import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_states.dart';
import 'package:quick_click/core/util/const.dart';
import 'package:quick_click/core/util/widgets/bottom_nav_bar.dart';
import 'package:quick_click/features/layout_page/presentation/widgets/layout_widgets.dart';



class LayoutPage extends StatelessWidget {
  LayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: primaryColor,
            appBar: mainAppBarForLayout(context),
            bottomNavigationBar: myBottomNavBar(context: context),
            body: AppCubit.get(context).pages[AppCubit.get(context).selectedIndex],
        );
      },
    );
  }
}

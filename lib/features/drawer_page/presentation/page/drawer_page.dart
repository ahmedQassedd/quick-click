import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_states.dart';
import 'package:quick_click/features/layout_page/presentation/page/layout_page.dart';
import 'package:quick_click/features/menu_page/presentation/page/menu_page.dart';

final zoomDrawerController = ZoomDrawerController();


class DrawerPage extends StatelessWidget {
  DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return  Scaffold(
            backgroundColor: const Color(0xFF404040),
            body: ZoomDrawer(
              controller: zoomDrawerController,
              menuScreen: MenuPage(),
              mainScreen: LayoutPage(),
              borderRadius: 30.0,
              showShadow: true,
              angle: 12.0,
              drawerShadowsBackgroundColor: Colors.grey.shade200,
              slideWidth: MediaQuery.of(context).size.width * 0.5,

            ),
        );
      },
    );
  }
}

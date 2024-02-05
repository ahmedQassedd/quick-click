import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/widgets/my_divider.dart';



Widget myBottomNavBar({context}) => Column(
  mainAxisSize: MainAxisSize.min,
  children: [

  myDivider(context: context),
  Container(
    padding: const EdgeInsetsDirectional.symmetric(vertical: 20),
    child:   GNav(
      padding: const EdgeInsetsDirectional.all(20),
        color: Colors.grey,
        activeColor: Colors.black,
        tabActiveBorder: Border.all(color: Colors.grey.withOpacity(0.2)),
        tabBackgroundColor: Colors.grey.shade50,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        iconSize: 20,
        onTabChange: (index) => AppCubit.get(context).navigateBottomBar(index),

        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.shopping_cart_rounded,
            text: 'Cart',
          ),
        ]
    ),
  ),

],);
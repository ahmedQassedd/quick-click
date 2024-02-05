import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/const.dart';

AppBar mainAppBarForLayout(context) => AppBar(
  centerTitle: true,
backgroundColor: primaryColor,
leading: IconButton(onPressed: (){

  if(AppCubit.get(context).profileModel?.status == true){

    if (ZoomDrawer.of(context)!.isOpen()) {
      ZoomDrawer.of(context)!.close();
    } else {
      ZoomDrawer.of(context)!.open();
    }



  }

}, icon: const Icon(Icons.menu)),
  title: AppCubit.get(context).selectedIndex == 1 ? Text('My Cart' , style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black , fontWeight: FontWeight.bold ),): null,
);

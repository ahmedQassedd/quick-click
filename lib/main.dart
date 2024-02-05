
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' ;
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:quick_click/core/di/injection.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_states.dart';
import 'package:quick_click/core/util/blocs/app_cubit/bloc_observer/bloc_observer.dart';
import 'package:quick_click/core/util/const.dart';
import 'package:quick_click/core/util/network/local/cache_helper.dart';
import 'package:quick_click/core/util/widgets/light_theme.dart';
import 'package:quick_click/features/layout_page/presentation/page/layout_page.dart';
import 'package:quick_click/features/menu_page/presentation/page/menu_page.dart';
import 'package:quick_click/features/signIn_page/presentation/page/signIn_page.dart';

final zoomDrawerController = ZoomDrawerController();



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.sharedInit();
  init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp , DeviceOrientation
    .portraitDown]
  );

  Widget firstPage ;

  token = CacheHelper.getData(key: 'token');


  print(token);

  if(token != null){

    firstPage = LayoutPage();


  }
  else
  {
    firstPage = SignInPage();
  }


  runApp(MyApp(firstPage));
}

class MyApp extends StatelessWidget {

  Widget firstPage ;

  MyApp(this.firstPage);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<AppCubit>()..homeMethod(token: token)..getCartMethod(token: token)..profileMethod(token: token),
      child: BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightingTheme(),
          home: Scaffold(
            backgroundColor: const Color(0xFF404040),
            body: ZoomDrawer(
              controller: zoomDrawerController,
              menuScreen: MenuPage(),
              mainScreen: firstPage,
              borderRadius: 30.0,
              showShadow: true,
              angle: 12.0,
              drawerShadowsBackgroundColor: Colors.grey.shade200,
              slideWidth: MediaQuery.of(context).size.width * 0.5,

            ),
          ),
        );
      }),
    );
  }
}

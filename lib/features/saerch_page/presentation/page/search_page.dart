import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_states.dart';
import 'package:quick_click/core/util/const.dart';
import 'package:quick_click/core/util/widgets/show_toast.dart';
import 'package:quick_click/features/saerch_page/presentation/widgets/search_widgets.dart';



class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is SuccessSearchState && (AppCubit.get(context).searchModel?.data?.data?.isEmpty)! ){

          showToast(text: 'Item Not Found!');
        }

        },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: primaryColor,
            body: mainWidgetForSearch(context , state));
      },
    );
  }
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_states.dart';
import 'package:quick_click/core/util/const.dart';
import 'package:quick_click/core/util/widgets/show_toast.dart';
import 'package:quick_click/features/cart_page/presentation/widgets/cart_widgets.dart';



class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {

        if(state is SuccessAddCartState){
          showToast(text: AppCubit.get(context).addCartModel?.message);
        }

      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: primaryColor,
            body: ConditionalBuilder(
              condition: AppCubit.get(context).getCartModel?.status == null || state is LoadingGetCartState || state is LoadingAddCartState || state is SelectedIndexState ,
                  builder: (context) => const Center(child: CircularProgressIndicator(color: Colors.black,)),
              fallback: (context) =>  (AppCubit.get(context).getCartModel?.data?.cartItems?.isEmpty)! ?  Center(child: Text('Your Cart Is Empty!' , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black38 , letterSpacing: 1 , fontWeight: FontWeight.bold))) : mainWidgetForCart(context: context),
            ));
      },
    );
  }
}

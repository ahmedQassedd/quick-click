import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:quick_click/core/models/get_cart_model.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/const.dart';

Widget  mainWidgetForCart({context}) =>  Padding(
  padding: const EdgeInsetsDirectional.only(top: 15, start: 20 , end: 20 , bottom: 5 ),
  child: Column(children: [
    Expanded(
      child: SizedBox(
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context , index) =>  cartItem(context: context , index: index , model: AppCubit.get(context).getCartModel),
            separatorBuilder: (context , index) => const SizedBox(height: 20,),
            itemCount: AppCubit.get(context).getCartModel!.data!.cartItems!.length),
      ),
    ),
    const SizedBox(height:10),
    Container(height: 70,
      decoration:  BoxDecoration(color: Colors.black , borderRadius: BorderRadius.circular(12)),
      child: ElasticIn( duration: const Duration(milliseconds: 500) , child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Total: ' ,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white , fontWeight: FontWeight.bold) ),
          Text('\$${AppCubit.get(context).getCartModel?.data?.total}' ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white , fontWeight: FontWeight.bold) ),
        ],),
      )),),
  ],),
);




Widget cartItem({required context , GetCartModel? model, index}) => Container(
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12)
  ),
  child: Padding(
    padding: const EdgeInsetsDirectional.all(15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Image(
        image: NetworkImage(
            model?.data?.cartItems?[index].product?.image),
        height: 70,
        width: 70,
      ),
        const SizedBox(width:5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(  model?.data?.cartItems?[index].product?.name , maxLines: 1 , overflow: TextOverflow.ellipsis  , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black , fontWeight: FontWeight.bold),),
              const SizedBox(height: 5,),
              Text('\$${model?.data?.cartItems?[index].product?.price}', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.black54 , fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        const SizedBox(width:5),
        InkWell(
          onTap: (){

            AppCubit.get(context).addCartMethod(id: model?.data?.cartItems?[index].product?.id, token: token);

          },
          child: Container(height: 40, width: 40,
            decoration: const BoxDecoration(color: Colors.black , borderRadius: BorderRadius.only(topLeft: Radius.circular(12) , bottomRight: Radius.circular(12))),
            child: const Icon(Icons.delete_rounded , color: Colors.white,size: 18,),),
        ),


    ],),
  ),


);
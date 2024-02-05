
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quick_click/core/models/home_model.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/const.dart';
import 'package:quick_click/core/util/widgets/navigete_to.dart';
import 'package:quick_click/features/saerch_page/presentation/page/search_page.dart';
import 'package:quick_click/features/saerch_page/presentation/widgets/search_widgets.dart';





Widget mainWidgetForHome(context) => Padding(
  padding: const EdgeInsetsDirectional.only(top: 15, start: 15 , end: 15 ),
  child:   Column(
    children: [
    InkWell(
      onTap: (){

        searchController.text = '' ;
        AppCubit.get(context).searchModel = null ;

        navigateTo(context: context, widget: SearchPage() , pageTransitionType: PageTransitionType.topToBottom);

      },
      child: Container( height: 50, width: double.infinity, decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(10)), child:   Padding(
        padding: const EdgeInsetsDirectional.all(15),
        child: Row(children: [
          Text('Search' , style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.black54),),
          const Spacer(),
          const Icon(Icons.search_rounded , color: Colors.black54,),
        ],),
      ) ,
  ),
    ),

   const SizedBox(height: 5),

   Expanded(
     child: SingleChildScrollView(
       physics: const BouncingScrollPhysics(),
       child: Column(
         children: [
           Padding(
             padding: const EdgeInsetsDirectional.symmetric(vertical: 20),
             child: SizedBox(
               height: 50,
               child: ListView.separated(
                   physics: const BouncingScrollPhysics(),
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context , index) => SizedBox(
                       height: 50,
                       width: 50,
                       child: categoryImages[index]),
                   separatorBuilder: (context , index) => const SizedBox(width: 20,),
                   itemCount: categoryImages.length),),
           ),

         Column(
           children: [

             Padding(
                 padding: const EdgeInsetsDirectional.symmetric(vertical: 15),
                 child: SizedBox(
                     width: double.infinity,
                     child: Text('Hot Picks 🔥' , style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black , fontWeight: FontWeight.bold),))),

             Padding(
               padding: const EdgeInsetsDirectional.only(bottom: 20),
               child: SizedBox(
                 height: MediaQuery.of(context).size.height/2.2,
                 child: ListView.separated(
                     physics: const BouncingScrollPhysics(),
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (context , index) =>  productItem(context: context , index: index , model: AppCubit.get(context).homeModel),
                     separatorBuilder: (context , index) => const SizedBox(width: 20,),
                     itemCount: AppCubit.get(context).homeModel!.data!.products!.length),
               ),
             ),

           ],),

       ],),
     ),
   ),



  ],),
);





Widget productItem({required context , HomeModel? model, index}) => Container(
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12)
  ),
  height: MediaQuery.of(context).size.height/2.2,
  width: MediaQuery.of(context).size.width/1.5,
  child:  Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [

          if(model?.data?.products?[index].discount != 0)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(height: 50, width: 50,
                decoration: const BoxDecoration(color: Colors.redAccent , borderRadius: BorderRadius.only(topLeft: Radius.circular(12) , bottomRight: Radius.circular(12))),
                child: Center(child: Text('SALE' , style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white , fontWeight: FontWeight.bold),)),
              ),
             const Spacer(),
             const SizedBox(),
            ],
          ),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 70),
          child: Image(
            image: NetworkImage(
                model?.data?.products?[index].image),
            height: MediaQuery.of(context).size.height/5,
            width: MediaQuery.of(context).size.width/2,
          ),),



      ],),

      SizedBox(
        height: MediaQuery.of(context).size.height/7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

          Padding(
              padding: const EdgeInsetsDirectional.only(top: 15, start: 15 , end: 15 ),
              child: Text('${model?.data?.products?[index].name}' , maxLines: 2 , overflow: TextOverflow.ellipsis , style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.black54),)),

          Padding(
            padding: const EdgeInsetsDirectional.only(start: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Text('\$${model?.data?.products?[index].price}' , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black , fontWeight: FontWeight.bold),),
                  const SizedBox(width: 8,),
                  if(model?.data?.products?[index].discount != 0)
                  Text('\$${model?.data?.products?[index].oldPrice}' ,  style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.black54 , decoration: TextDecoration.lineThrough),),

                ],),
                InkWell(
                  onTap: (){

                    AppCubit.get(context).addCartMethod(id: model?.data?.products?[index].id, token: token);

                  },
                  child: Container(height: 50, width: 50,
                    decoration: const BoxDecoration(color: Colors.black , borderRadius: BorderRadius.only(topLeft: Radius.circular(12) , bottomRight: Radius.circular(12))),
                    child: ElasticIn( duration: const Duration(milliseconds: 500) , child: (AppCubit.get(context).inCart[model?.data?.products?[index].id])! ? const Icon(Icons.check , color: Colors.white,size: 17,) : const Icon(Icons.shopping_cart_rounded , color: Colors.white,size: 17,),),),
                ),

              ],),
          ),

        ],),
      ),

    ],),
);




List categoryImages =[
  Image.asset('assets/mouse.png'),
  Image.asset('assets/pc.png'),
  Image.asset('assets/keyboard.png'),
  Image.asset('assets/mobile.png'),
  Image.asset('assets/tshirt.png'),
  Image.asset('assets/baby_cloth.png'),
  Image.asset('assets/chair.png'),
  Image.asset('assets/bed.png'),
  Image.asset('assets/sofa.png'),
  Image.asset('assets/table.png'),
];
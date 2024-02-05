import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:quick_click/core/models/search_model.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:quick_click/core/util/blocs/app_cubit/app_states.dart';
import 'package:quick_click/core/util/const.dart';
import 'package:quick_click/core/util/widgets/text_form_field.dart';

var searchController = TextEditingController();
var searchFormKey = GlobalKey<FormState>();



Widget mainWidgetForSearch(context , state) => SafeArea(
  child:   Padding( 
    padding: const EdgeInsetsDirectional.all(15),
    child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
                onTap: (){Navigator.pop(context);},
                child: Container( height: 47 ,decoration: BoxDecoration(color: Colors.black.withOpacity(0.3) , borderRadius: BorderRadiusDirectional.circular(10)), child:  const Icon(Icons.arrow_back_ios_new_outlined , color: Colors.white, size: 18,),)),
          ),
          const SizedBox(width: 10,),
          Expanded(
            flex: 6,
            child: Form(
              key: searchFormKey,
              child: SizedBox(

                child: defaultTextFormField(

                    context: context,
                    controller: searchController,
                    inputType: TextInputType.text,
                    hint: 'Search',
                    suffixIcon: Icons.search_sharp,
                    suffixPressed: (){

                      if(searchController.text.isNotEmpty ){

                        FocusManager.instance.primaryFocus?.unfocus();


                        AppCubit.get(context).searchMethod(text: searchController.text , token: token);

                      }


                    },
                  ),
              ),
            ),
          ),

        ],

      ),

      const SizedBox(height: 20,),
 
      ConditionalBuilder(
        condition: state is LoadingSearchState,
        builder: (context) =>   const Center(child: CircularProgressIndicator(color: Colors.black,)),
        fallback: (context) =>  Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context , index) =>  searchItem(context: context , index: index , model: AppCubit.get(context).searchModel),
                  separatorBuilder: (context , index) => const SizedBox(height: 20,),
                  itemCount: AppCubit.get(context).searchModel == null ? 0 : AppCubit.get(context).searchModel!.data!.data!.length ),
            ),
          ),
        ),),



    ],),
  ),
);




Widget searchItem({required context , SearchModel? model, index}) => Container(
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
              model?.data?.data?[index].image),
          height: 70,
          width: 70,
        ),
        const SizedBox(width:5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(  model?.data?.data?[index].name , maxLines: 1 , overflow: TextOverflow.ellipsis  , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black , fontWeight: FontWeight.bold),),
              const SizedBox(height: 5,),
              Text('\$${model?.data?.data?[index].price}', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.black54 , fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        const SizedBox(width:5),
        InkWell(
          onTap: (){
              AppCubit.get(context).addCartMethod(id: model?.data?.data?[index].id, token: token);
             AppCubit.get(context).getCartMethod(token: token);
             Navigator.pop(context);
          },
          child: Container(height: 50, width: 50,
            decoration: const BoxDecoration(color: Colors.black , borderRadius: BorderRadius.only(topLeft: Radius.circular(12) , bottomRight: Radius.circular(12))),
            child: ElasticIn( duration: const Duration(milliseconds: 500) , child:
                model?.data?.data?[index].inCart ?
            const Icon(Icons.check , color: Colors.white,size: 17,) :
            const Icon(Icons.shopping_cart_rounded , color: Colors.white,size: 17,),),),
        ),


      ],),
  ),


);




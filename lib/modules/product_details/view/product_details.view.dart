import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:rapidor_ecommerce/global/config/config.dart';
import 'package:rapidor_ecommerce/global/config/db_key.dart';
import 'package:rapidor_ecommerce/global/function/functional.constants.dart';
import 'package:rapidor_ecommerce/global/styles/colors.dart';
import 'package:rapidor_ecommerce/modules/cart/view/cart.view.dart';
import 'package:shimmer/shimmer.dart';

import '../../products/model/product.model.dart';

class ProductDetailsView extends StatelessWidget {

  final ProductListModel? model;
  const ProductDetailsView({super.key, this.model});
static const route = '/productDetailsView';
Size size (context)=> MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: 
    SafeArea(
      bottom: false,
      child: SizedBox(
        height: size(context).height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          //*----- Image section
        Expanded(
          flex: 9,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height:size(context).height/3,
                  child: Center(
                    child: CachedNetworkImage(
                                       placeholder: (context, val) {
                                            return SizedBox(
                                             
                                             
                                              height: 180.0.h,
                                              child: Shimmer.fromColors(
                                                  baseColor: kEGrey,
                                                  highlightColor: kWhite,
                                                  child: Container(
                                                    height: 180.h,
                                             
                                                     decoration: BoxDecoration(
                                                    color: kWhite,
                          
                                                borderRadius: BorderRadius.circular(8.r),
                                              ),
                                                  )),
                                            );
                                          },
                                          errorWidget:
                                              (BuildContext ctx, String data, Object _) {
                                            return const Icon(Icons.error,color: kBlack,);
                                          },
                                          fit: BoxFit.cover,
                                          imageUrl: model?.image??'',
                                        
                                        ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(Icons.star,color: kFail,),
                                    const Gap(4),
                                    kStyles.semiBold24(text: "${model?.rating?.rate??'-'}"),
                                    const Gap(4),
                
                                    kStyles.med16(text: "(${model?.rating?.count??'-'})"),
                                  ],
                                ),
                     Gap(20.h),
                    kStyles.bold26(text: model?.title??'-'),
                     Gap(10.h),
                                
                    Row(
                      children: [
                        kStyles.semiBold18(text: "Category - "),
                        SizedBox(
                          width: size(context).width/1.8,
                          child:
                          
                          
                           kStyles.semiBold20(
                           
                            text:model?.category??'-')),
                      ],
                    ),
                     Gap(10.h),
                    Row(
                      children: [
                        kStyles.semiBold18(text: "price - "),
                        SizedBox(
                          width: size(context).width/1.5,
                          child: kStyles.semiBold24(text: "₹ ${FunctionalConstants().doubleAmount((model?.price).toString())}/-")),
                      ],
                      
                    ),
                     Gap(10.h),
                    kStyles.reg18(text: model?.description??'-'),
                  
                    
                  
                  
                  ],
                  ),
                ),
              ],
            ),
          ),
        
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: kBlack),
                  
                  onPressed: (){

                      Fluttertoast.showToast(
          msg:
              "Product added successfully");
                    if(
                    cartProducts.values.toList().contains(model!)||cartProducts.values.toList().any(( val){return val.id == model?.id;})
                    ){
                    int index = cartProducts.values.toList().indexWhere((value)=>value==model!);
                    log(index.toString());
                   model?.itemCount=(model?.itemCount??0)+1;
                    cartProducts.putAt(index, model);
                    }else{
                      model?.itemCount=1;
                       cartProducts.add(model!);
                    }
                   
                  }, child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: kStyles.semiBold20(text: "Add to cart",color: kWhite),
                  )),
                const Gap(20),
              ],
            ),
          ),
        )
        ],
        ),
      ),
    ),
    floatingActionButtonLocation:FloatingActionButtonLocation.endTop ,
      floatingActionButton: FloatingActionButton(
        backgroundColor:kFail ,
        onPressed: (){
Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) =>const CartView(),
    ),);
          
        },child:const Icon(Icons.shopping_bag,color: kWhite,),),
    );
  }
}
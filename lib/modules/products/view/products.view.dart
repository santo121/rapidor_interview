import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:rapidor_ecommerce/global/config/config.dart';
import 'package:rapidor_ecommerce/global/function/functional.constants.dart';
import 'package:rapidor_ecommerce/global/interceptor/models.interceptor.dart';
import 'package:rapidor_ecommerce/global/styles/colors.dart';
import 'package:rapidor_ecommerce/modules/cart/view/cart.view.dart';
import 'package:rapidor_ecommerce/modules/product_details/view/product_details.view.dart';
import 'package:rapidor_ecommerce/modules/products/controller/product_list.controller.dart';
import 'package:shimmer/shimmer.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});
static const route = '/';

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {

@override
void initState() {

  WidgetsBinding.instance.addPostFrameCallback((value){
    Provider.of<ProductController>(context,listen: false).getProductList(context);
  });
  super.initState();
  
}

  double shimmerColor()=> (MediaQuery.of(context).size.width/2)-28;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:SafeArea(
        bottom: false,
        child: Consumer2<ModelInterceptor,ProductController>(
          builder: (context,modelData,pCtrl,_) {
            return 
           (pCtrl. apiLoading)?const Center(child: CircularProgressIndicator()):
            MasonryGridView.builder(gridDelegate:const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
            ),
            itemCount:modelData.productListModel.length ,
             itemBuilder:(context,index){
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) =>  ProductDetailsView(
        model: modelData.productListModel[index],
      ),
    ),);
                  },
                  child: Container(
                  
                    decoration:BoxDecoration(
                      color: kWhite,
                  
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                       BoxShadow(
                   color:kBlack.withOpacity(0.12),
                   offset:const Offset(0, 4),
                   blurRadius: 9,
                   spreadRadius: 4,
                  )
                      ]
                    ) ,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                               placeholder: (context, val) {
                                    return SizedBox(
                                     
                                      width: shimmerColor(),
                                      height: 180.0,
                                      child: Shimmer.fromColors(
                                          baseColor: kEGrey,
                                          highlightColor: kWhite,
                                          child: Container(
                                            height: 180.h,
                                            width: shimmerColor(),
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
                                  imageUrl:modelData.productListModel[index].image??'',
                                
                                ),
                            //  Image.network(ApiUrl().loadImage(dataSnap?[index].image??'')),
                          
                          Gap(20.h),
                          kStyles.semiBold18(text: modelData.productListModel[index].title??'-'),
                          Gap(2.h),

                          kStyles.med16(text: "₹ ${FunctionalConstants().doubleAmount(modelData.productListModel[index].price.toString())}/-"),
                          Gap(2.h),

                         Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(Icons.star,color: kFail,size: 16,),
                                    const Gap(4),
                                    kStyles.semiBold16(text: (modelData.productListModel[index].rating?.rate??'-').toString()),
                                    const Gap(4),
                                    kStyles.med16(text: "(${(modelData.productListModel[index].rating?.count??'-').toString()})"),
                                  ],
                                ),
                          Gap(2.h),

                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
          }
        ),
        
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.miniStartFloat ,
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
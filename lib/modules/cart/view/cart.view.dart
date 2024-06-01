import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rapidor_ecommerce/global/config/config.dart';
import 'package:rapidor_ecommerce/global/config/db_key.dart';
import 'package:rapidor_ecommerce/global/styles/colors.dart';

import 'package:rapidor_ecommerce/modules/products/model/product.model.dart';
import 'package:shimmer/shimmer.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});
  static const route = '/CartView';
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 9,
              child: ListView.builder(
                itemCount: cartProducts.length,
                itemBuilder: (context, index) {
                  ProductListModel cartItem = cartProducts.getAt(index);
              
                  return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: kWhite, borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
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
                              errorWidget: (BuildContext ctx, String data, Object _) {
                                return const Icon(
                                  Icons.error,
                                  color: kBlack,
                                );
                              },
                              fit: BoxFit.cover,
                              imageUrl: cartItem.image ?? '',
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            flex: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kStyles.bold18(text: cartItem.title ?? ''),
                                const Gap(10),
                                kStyles.bold18(
                                    text:
                                        "₹ ${((cartItem.price ?? 0) * (cartItem.itemCount ?? 0)).toStringAsFixed(2)}/-"),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          //*--- has to convert in to controller
                                          setState(() {
                                            if ((cartItem.itemCount ?? 0) >= 1) {
                                              cartItem.itemCount =
                                                  (cartItem.itemCount ?? 0) - 1;
                                            } else if ((cartItem.itemCount ?? 0) ==
                                                0) {
                                              cartProducts.deleteAt(index);
                                            }
                                          });
                                        },
                                        icon: const Icon(Icons.remove)),
                                    kStyles.bold18(
                                        text: (cartItem.itemCount ?? '').toString()),
                                    IconButton(
                                        onPressed: () {
                                          //*--- has to convert in to controller
                                          setState(() {
                                            cartItem.itemCount =
                                                (cartItem.itemCount ?? 0) + 1;
                                          });
                                        },
                                        icon: const Icon(Icons.add))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
                },
              ),
            ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          backgroundColor: kBlack),
                        
                        onPressed: (){
                 
                         
                       
                         
                        }, child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: kStyles.semiBold20(text: "Continue",color: kWhite),
                        )),
               ),
              const Gap(20),
             ],
           )
          ],
        );
      }),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:rapidor_ecommerce/modules/cart/view/cart.view.dart';
import 'package:rapidor_ecommerce/modules/products/view/products.view.dart';

import '../../modules/product_details/view/product_details.view.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ProductView.route: (BuildContext context) => const ProductView(),
   ProductDetailsView.route: (BuildContext context) => const  ProductDetailsView(),
   CartView.route: (BuildContext context) => const  CartView(),

};

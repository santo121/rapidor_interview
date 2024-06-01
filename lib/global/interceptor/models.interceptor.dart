

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rapidor_ecommerce/modules/cart/model/cart.model.dart';
import 'dart:convert';

import '../../modules/products/model/product.model.dart';

class ModelInterceptor with ChangeNotifier {
  
 List<ProductListModel> productListModel = [];
 CartItems cartItemList = CartItems();

 setProductListModel(Response response){
  for(final data in json.decode(response.body)){
    productListModel.add(ProductListModel.fromJson(data));
  }
  notifyListeners();
 }
 setCartItems(Response response){
  cartItemList = CartItems.fromJson(json.decode(response.body));
  notifyListeners();
 }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidor_ecommerce/modules/cart/service/cart.service.dart';

import '../../../global/interceptor/models.interceptor.dart';

class CartController with ChangeNotifier{

getCartItems(context)async{
final response = await CartService().getCartItem();
if(response.statusCode == 200){
final modelCtrl = Provider.of<ModelInterceptor>(context,listen: false);
  modelCtrl.setCartItems(response);
}
}

}
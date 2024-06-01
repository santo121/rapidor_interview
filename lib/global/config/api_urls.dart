

import 'package:rapidor_ecommerce/global/config/config.dart';

class ApiUrl {
//*---------------------------------------------------------------- (products) 
///*---(Get all products)
final String getAllProducts = '${Config().baseUrl}products';
///*---(Get a single product)
String getSingleProducts(int id)=> '${Config().baseUrl}products/$id';
///*---(Get all categories)
final String getAllCategory= '${Config().baseUrl}products/categories';
//*---------------------------------------------------------------- (cart) 
///*---(Get cart)
String getCartItem(id)=> '${Config().baseUrl}carts/$id';
///*---(add cart)
final String addCartItem= '${Config().baseUrl}carts';
///*---(Delete a cart item from the cart)
String deleteCart(int cartId)=> '${Config().baseUrl}carts/$cartId';



}

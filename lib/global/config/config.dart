
import 'package:easy_reo_fonts/easy_reo_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'package:rapidor_ecommerce/global/interceptor/models.interceptor.dart';

import '../../modules/products/model/product.model.dart';


Box<ProductListModel> localDb = Hive.box<ProductListModel>(Config.cartName);

class Config {
  //*--- Base url
  final String baseUrl = 'https://fakestoreapi.com/';
  //*--- Hive Database Name
  static const String dbName = 'Rapidore_Key';
  static const String cartName = 'Cart_Key';
  String tokenKey = 'authToken';
 //*--- money decimals 
 int moneyDecimals = 2; 
}

//*---------- (Global Context)
GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
BuildContext globalContext = navigationKey.currentState!.context;
//*---------- (Media_Query)
Size size = MediaQuery.sizeOf(globalContext);
KStyles kStyles = KStyles(fontFamily: 'Montserrat', fontType: FontType.googleFonts);



//*---------- (model Interceptor)
final dataInterceptor =
    Provider.of<ModelInterceptor>(globalContext, listen: false);

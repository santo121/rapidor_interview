import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rapidor_ecommerce/global/interceptor/models.interceptor.dart';
import 'package:rapidor_ecommerce/modules/cart/controller/cart.controller.dart';
import 'package:rapidor_ecommerce/modules/products/controller/product_list.controller.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => ModelInterceptor()),
  ChangeNotifierProvider(create: (context) => ProductController()),
  ChangeNotifierProvider(create: (context) => CartController()),

];
import 'dart:convert';

import 'package:http/http.dart';
import 'package:rapidor_ecommerce/global/config/api_urls.dart';
import 'package:rapidor_ecommerce/global/interceptor/network.interceptor.dart';

class AddCartService{

    Future<Response> addCartItem()async{
return await httpRequests(url: ApiUrl().addCartItem,
body: jsonEncode({
 "userId":5,
                    "date":2020-02-03,
                    "products":[{"productId":5,"quantity":1},{"productId":1,"quantity":5}]
}),
 httpType: HttpMethods.post);
  }
}
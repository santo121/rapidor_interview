import 'package:http/http.dart';

import '../../../global/config/api_urls.dart';
import '../../../global/interceptor/network.interceptor.dart';

class CartService{
   Future<Response> getCartItem()async{
return await httpRequests(url: ApiUrl().getCartItem(5),
 httpType: HttpMethods.get);
  }
}
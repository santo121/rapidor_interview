import 'package:http/http.dart';
import 'package:rapidor_ecommerce/global/config/api_urls.dart';
import 'package:rapidor_ecommerce/global/interceptor/network.interceptor.dart';

class ProductService{


  Future<Response> getProducts()async{
return await httpRequests(url: ApiUrl().getAllProducts,
 httpType: HttpMethods.get);
  }
}
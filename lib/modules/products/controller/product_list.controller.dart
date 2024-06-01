import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rapidor_ecommerce/global/interceptor/models.interceptor.dart';
import 'package:rapidor_ecommerce/modules/products/service/products.service.dart';

class ProductController with ChangeNotifier{
  bool apiLoading = false;
  getProductList(context)async{
    apiLoading = true;
    notifyListeners();
  ProductService service = ProductService();

   final response = await service.getProducts();

    if(response.statusCode==200){
  final ctrl =  Provider.of<ModelInterceptor>(context,listen: false);

      ctrl.setProductListModel(response);
    }
    apiLoading = false;
    notifyListeners();
  }
}
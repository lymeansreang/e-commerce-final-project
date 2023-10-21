import 'package:ecommerce/data/network/api_service.dart';
import 'package:ecommerce/models/ProductModel.dart';
import 'package:ecommerce/res/app_url.dart';

class ProductsRepository{

  final _apiService = ApiService();

  Future<ProductModel> getProducts() async{
    try{
      dynamic responses = await _apiService.getApiResponse(AppUrl.getAllProducts);
      // print('response ${responses["data"][0]["attributes"]["name"]}');
      // print('response in model ${ProductModel.fromJson(responses)}');
      return ProductModel.fromJson(responses);
    }catch(e){
      rethrow;
    }
  }
}
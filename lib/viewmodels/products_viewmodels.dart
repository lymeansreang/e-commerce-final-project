import 'package:ecommerce/data/response/api_response.dart';
import 'package:ecommerce/models/ProductModel.dart';
import 'package:ecommerce/repositories/products_repository.dart';
import 'package:flutter/material.dart';

class ProductsViewModels extends ChangeNotifier{

  final _productRepo = ProductsRepository();

  ApiResponse<dynamic> response = ApiResponse.loading();

  setProductList(response){
    this.response = response;
    notifyListeners();
  }
  Future<dynamic?> getAllProducts() async{
    await _productRepo.getProducts()
        .then((products){
          // print('response in model ${products.data!.length}');
          setProductList(ApiResponse.completed(products));})
        .onError((error, stackTrace) => setProductList(ApiResponse.error(stackTrace.toString())));
  }
}
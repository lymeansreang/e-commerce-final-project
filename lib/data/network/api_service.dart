import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/data/app_exception.dart';
import 'package:http/http.dart' as http;

class ApiService{
  dynamic responseJson;

  Future<dynamic> getApiResponse(String url) async{
    try{
      var response = await  http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  returnResponse(http.Response response) {
    switch(response.statusCode){
      case 200:
        // print('jsonDecode ${jsonDecode(response.body)}');
        return jsonDecode(response.body);
      case 500:
        throw BedRequestException('Please check your request body '); 
    }
  }
}
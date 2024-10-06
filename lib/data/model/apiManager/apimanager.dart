import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:task/data/model/responses/product_response.dart';

import '../../../domain/result.dart';
import '../responses/errorResponse.dart';
import 'package:task/data/model/extensions.dart';
@singleton
class ApiManager
{
  final dio= Dio();

  static String baseUrl = "https://fakestoreapi.com";
  static String productUrl = "$baseUrl/products";

  Future<Result<List<ProductResponse>>> loadProducts()async{
    var response = await dio.get(productUrl);


    try{
      if(response.statusCode?.isSuccessCall() == true ){
        List<ProductResponse> productResponse = (response.data as List)
            .map((i) => ProductResponse.fromJson(i))
            .toList();
        return Success(data: productResponse);
      }
      var errorResponse=ErrorResponse.fromJson(response.data);
      return ServerError(ServerErrorException(errorResponse.statusMessage));


    }on Exception
    catch(ex){
      return Error(ex);

    }


  }


}


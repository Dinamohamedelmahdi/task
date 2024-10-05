import '../../domain/result.dart';
import '../model/responses/product_response.dart';

abstract class ProductDataSource{
  Future<Result<List<ProductResponse>?>> getProduct();
}
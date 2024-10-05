import '../../data/model/responses/product_response.dart';
import '../result.dart';

abstract class ProductRepository{
  Future<Result<List<ProductResponse>?>> getProduct();
}
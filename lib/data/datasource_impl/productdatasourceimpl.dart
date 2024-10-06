

import 'package:injectable/injectable.dart';

import '../../domain/result.dart';
import '../datasource/productdatasource.dart';
import '../model/apiManager/apimanager.dart';
import '../model/responses/product_response.dart';

@Injectable(as: ProductDataSource)
class ProductDatasourceImpl implements ProductDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  ProductDatasourceImpl(this.apiManager);

  @override
  Future<Result<List<ProductResponse>?>> getProduct() {
    return apiManager.loadProducts();
    //dependency
  }

}

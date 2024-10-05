import 'package:injectable/injectable.dart';

import '../../domain/repository/productrepository.dart';
import '../../domain/result.dart';
import '../datasource/productdatasource.dart';
import '../model/responses/product_response.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository{
  ProductDataSource dataSource;
  @factoryMethod
  ProductRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<ProductResponse>?>> getProduct(){
    return dataSource.getProduct();
  }

}

import 'package:injectable/injectable.dart';

import 'package:task/domain/repository/productrepository.dart';
import 'package:task/domain/result.dart';

import '../data/model/responses/product_response.dart';

import '';
import 'package:flutter_bloc/flutter_bloc.dart';
@injectable
class  HomeViewModel extends Cubit<HomeState> {
  ProductRepository productRepository;
  HomeViewModel(this.productRepository) :super(ProductsLoadingState());


  void getProducts() async
  {
    emit(ProductsLoadingState());
    var products = await productRepository.getProduct();
    switch (products) {
      case Success<List<ProductResponse>?>():
        emit(ProductsSuccessState(products.data));

      case ServerError<List<ProductResponse>?>():emit(ProductsErrorState(products.exception));

      case Error<List<ProductResponse>?>():emit(ProductsErrorState(products.exception));
    }
  }
}

sealed class HomeState {}

class ProductsLoadingState extends HomeState {

}

class ProductsSuccessState extends HomeState {
  List<ProductResponse>? productResponseResults;
  ProductsSuccessState(this.productResponseResults);
}

class ProductsErrorState extends HomeState {
  Exception exception;
 ProductsErrorState(this.exception);
}


import 'package:injectable/injectable.dart';
import 'package:task/domain/repository/productrepository.dart';
import 'package:task/domain/result.dart';
import '../data/model/responses/product_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
@injectable

class  HomeViewModel extends Cubit<HomeState> {
  ProductRepository productRepository;

  HomeViewModel(this.productRepository) :super(ProductsLoadingState());


  void getProductsHomeScreen() async
  {
    emit(ProductsLoadingState());
    var productsResult = await productRepository.getProduct();

    switch (productsResult) {
      case Success():
        { emit(ProductsSuccessState(productsResult.data));}

      case ServerError():
        {      emit(ProductsErrorState(productsResult.exception));}

      case Error<List<ProductResponse>?>():

      {     emit(ProductsErrorState(productsResult.exception));}
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






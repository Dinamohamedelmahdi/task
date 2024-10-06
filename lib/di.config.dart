// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'data/datasource/productdatasource.dart' as _i569;
import 'data/datasource_impl/productdatasourceimpl.dart' as _i323;
import 'data/model/apiManager/apimanager.dart' as _i778;
import 'data/repository_impl/productrepository_impl.dart' as _i358;
import 'domain/repository/productrepository.dart' as _i960;
import 'presentation/homeViewModel.dart' as _i951;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i778.ApiManager>(() => _i778.ApiManager());
    gh.factory<_i569.ProductDataSource>(
        () => _i323.ProductDatasourceImpl(gh<_i778.ApiManager>()));
    gh.factory<_i960.ProductRepository>(
        () => _i358.ProductRepositoryImpl(gh<_i569.ProductDataSource>()));
    gh.factory<_i951.HomeViewModel>(
        () => _i951.HomeViewModel(gh<_i960.ProductRepository>()));
    return this;
  }
}

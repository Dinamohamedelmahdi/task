import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/data/model/apiManager/apimanager.dart';
import 'package:task/presentation/homeViewModel.dart';
import 'package:task/presentation/ui/ErrorStateWidget.dart';
import 'package:task/presentation/ui/loadingwidget.dart';
import 'package:task/presentation/ui/productWidget.dart';

import '../../data/model/productclass.dart';
import '../../di.dart';

class  HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//field injection
var homeViewModel = getIt.get<HomeViewModel>();


class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.getProducts();
  }
  @override
  Widget build(BuildContext context) {

    return
      BlocProvider(create: (BuildContext context)=>homeViewModel,
        child: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          actions: [
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                // Filter button action here
              },
            ),
          ],
        ),
          body: BlocBuilder<HomeViewModel, HomeState>(
              builder: (context, state) {
            switch (state) {
              case ProductsLoadingState():{return LoadingWidget();}

              case ProductsSuccessState():
                {
   var productsList=state.productResponseResults ?? [];

                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product:productsList[index]);
                    },
                  );
                }

              case ProductsErrorState():{
                return ErrorStateWidget(state.exception);}

            }
          }),
        ));
  }
}


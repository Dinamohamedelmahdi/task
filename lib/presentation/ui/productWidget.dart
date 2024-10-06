import 'package:flutter/material.dart';

import '../../data/model/productclass.dart';
import '../../data/model/responses/product_response.dart';



class ProductCard extends StatelessWidget {
  ProductResponse product;
  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomRight,
      children: [
        Stack(alignment: Alignment.topRight,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      product.image,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text('EGP ${product.price.toString()}',
                            style: TextStyle(color: Colors.grey)),
                        Row(
                          children: [
                            Text('${product.rating.rate.toString()}'),
                            SizedBox(width: 5),
                            Icon(Icons.star, color: Colors.yellow, size: 16),


                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: (){},
                icon: Image.asset("assets/images/not_favorite.png",
                  height: 60,
                  width: 60,
                  fit:BoxFit.fill,)
            ),
          ],
        ),
        IconButton(onPressed: (){},
            icon:Icon(Icons.add_circle,color: Colors.blue,size: 40,)

        ),
      ],
    );
  }
}

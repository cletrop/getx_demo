import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/global_controller.dart';
import 'package:getx_demo/product/models/products.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<GlobalController>();
    return GetBuilder<GlobalController>(
      id: 'products',
      builder: (_) => ListView.builder(
        itemBuilder: (__, index) {
          final Product product = _.products[index];

          return ListTile(
            title: Text(product.name),
            subtitle: Text("USD ${product.price}"),
            trailing: IconButton(
              icon: Icon(
                Icons.favorite,
                color: product.isFavorite ? Colors.blueAccent : Colors.grey,
              ),
              onPressed: () {
                _.onFavorite(index, !product.isFavorite);
              },
            ),
          );
        },
        itemCount: _.products.length,
      ),
    );
  }
}

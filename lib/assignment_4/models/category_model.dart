import 'dart:developer';

import 'package:first_project/assignment_4/models/product_model.dart';

class CategoryModel {
  final int id;
  final String name;
  final List<ProductModel> products;

  CategoryModel(this.id, this.name, this.products);

  factory CategoryModel.fromMap(Map map) {
    List<ProductModel> products = (map['products'] as List)
        .map(
          (product) {
            final ProductModel productModel = ProductModel.fromMap(product);
            log(productModel.name);
            return productModel;
          },
        )
        .toList()
        .cast<ProductModel>();
    return CategoryModel(
      map['id'],
      map['name'],
      products,
    );
  }
}

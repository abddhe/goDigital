class ProductModel {
  final int id;
  final String name;
  final String image;
  final num price;

  ProductModel(this.id, this.name, this.image, this.price);

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      map['id'],
      map['name'],
      map['image'],
      map['price'],
    );
  }
}

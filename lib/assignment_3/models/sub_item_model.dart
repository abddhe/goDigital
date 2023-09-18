class SubItemModel {
  final String title;
  final double? price;
  final String type;
  bool isChecked;

  SubItemModel(this.title, this.price, this.type, this.isChecked);

  factory SubItemModel.fromMap(Map<String, dynamic> map) {
    return SubItemModel(map['title'], map['price'], map['type'],false);
  }
}

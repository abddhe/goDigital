import 'package:first_project/assignment_3/models/sub_item_model.dart';

class ItemModel {
  final String image;
  final String title;
  final String description;
  final double price;
  final List<SubItemModel> extras;

  ItemModel(this.image, this.title, this.description, this.price, this.extras);

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    List<SubItemModel> extras = [];
    map['extras'].forEach((ex) => extras.add(SubItemModel.fromMap(ex)));
    return ItemModel(
        map['image'], map['title'], map['description'], map['price'], extras);
  }
}

import 'package:first_project/assignment_3/data/data.dart';
import 'package:first_project/assignment_3/models/item_model.dart';
import 'package:first_project/assignment_3/models/sub_item_model.dart';
import 'package:first_project/assignment_3/widgets/custom_heading_section_title_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final itemModel = ItemModel.fromMap(itemData);
  late List<SubItemModel> subItemModelSize =
      itemModel.extras.where((subItem) => subItem.type == 'size').toList();
  late List<SubItemModel> subItemModelPlus =
      itemModel.extras.where((subItem) => subItem.type == 'plus').toList();
  var itemQuantity = 1;
  late double cartPrice = itemModel.price;

  @override
  void initState() {
    super.initState();
  }

  incrementItemQuantity() {
    setState(() {
      itemQuantity++;
      cartPrice += itemModel.price * itemQuantity;
    });
  }

  unIncrementItemQuantity() {
    setState(() {
      if (cartPrice > 0 && itemQuantity > 1) {
        itemQuantity--;
        cartPrice -= itemModel.price * itemQuantity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Card(
        margin: const EdgeInsets.all(0),
        elevation: 3,
        color:  Colors.grey.shade50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(

          children: [
            Container(
              height: 15,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,

                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0),
                  ],
                ),
              ),

            ),

            Positioned(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.cyan,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "إضافة للسلة",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$cartPrice د.ا",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 90,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                child: Image.network(
                  itemModel.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                  errorBuilder: (ctx, obj, st) {
                    return const Center(
                        child: Icon(Icons.image_not_supported_outlined));
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  itemModel.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(itemModel.description),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${itemModel.price} د.ا",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.black26),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                unIncrementItemQuantity();
                              },
                              icon: const Icon(
                                Icons.remove,
                                size: 20,
                                color: Colors.cyan,
                              ),
                              style: IconButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                              ),
                            ),
                            Text(
                              "$itemQuantity",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                incrementItemQuantity();
                              },
                              icon: const Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.cyan,
                              ),
                              style: IconButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 5,
                color: Colors.grey.shade300,
              ),
              const CustomHeadingSectionTitleWidget(
                title: "اختيارك من الحجم:",
                subTitle: "اختر من القائمة",
              ),
              ...subItemModelSize
                  .map((subItem) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(subItem.title),
                                Row(
                                  children: [
                                    Text(
                                      subItem.price != null
                                          ? "(${subItem.price} د.ا)"
                                          : "",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                            color: Colors.grey.shade100),
                                      ),
                                      value: subItem.isChecked,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            if (value!) {
                                              cartPrice += subItem.price ?? 0;
                                            }
                                            if (!value &&
                                                cartPrice !=
                                                    (subItem.price ?? 0)) {
                                              cartPrice -= subItem.price ?? 0;
                                            }

                                            subItem.isChecked =
                                                !subItem.isChecked;
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                            if (subItemModelSize
                                    .elementAt(subItemModelSize.length - 1) !=
                                subItem)
                              Container(
                                width: double.infinity,
                                height: 3,
                                color: Colors.grey.shade300,
                              ),
                          ],
                        ),
                      ))
                  .toList(),
              Container(
                width: double.infinity,
                height: 5,
                color: Colors.grey[450],
              ),
              Container(
                width: double.infinity,
                height: 5,
                color: Colors.grey.shade300,
              ),
              const CustomHeadingSectionTitleWidget(
                title: "اختيارك من الإضافات:",
                subTitle: "اختر من القائمة",
              ),
              ...subItemModelPlus
                  .map((subItem) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(subItem.title),
                                Row(
                                  children: [
                                    Text(
                                      subItem.price != null
                                          ? "(${subItem.price} د.ا)"
                                          : "",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                            color: Colors.grey.shade100),
                                      ),
                                      value: subItem.isChecked,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            if (value!) {
                                              cartPrice += subItem.price ?? 0;
                                            }
                                            if (!value &&
                                                cartPrice !=
                                                    (subItem.price ?? 0)) {
                                              cartPrice -= subItem.price ?? 0;
                                            }
                                            subItem.isChecked =
                                                !subItem.isChecked;
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                            if (subItemModelPlus
                                    .elementAt(subItemModelPlus.length - 1) !=
                                subItem)
                              Container(
                                width: double.infinity,
                                height: 3,
                                color: Colors.grey.shade300,
                              ),
                          ],
                        ),
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:first_project/assignment_4/data/data.dart';
import 'package:first_project/assignment_4/models/category_model.dart';
import 'package:first_project/assignment_4/models/product_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<CategoryModel> categoriesList =
      catsMap.map((e) => CategoryModel.fromMap(e)).toList();
  int selectGridItem = 0;
  int selectCategoryItem = 0;
  late List<ProductModel> selectedProducts =
      categoriesList[selectCategoryItem].products;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            "https://play-lh.googleusercontent.com/fnv9pLhhTcmerRPZIawNfuPWZFhubBhMh2qKBeskN3D7InSZPnjnCnGrrch0hDzo6Srt=w240-h480-rw",
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
            errorBuilder: (ctx, obj, st) {
              return const Center(
                child: Icon(Icons.image_not_supported_outlined),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoriesList.length,
                itemBuilder: (ctx, index) {
                  var category = categoriesList[index];
                  return GestureDetector(
                    onTap: (){
                      selectedProducts = category.products;
                      selectCategoryItem = index;
                      setState(() {

                      });
                    },
                    child: Container(
                      width: 150,
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsetsDirectional.only(end: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(
                            "https://play-lh.googleusercontent.com/fnv9pLhhTcmerRPZIawNfuPWZFhubBhMh2qKBeskN3D7InSZPnjnCnGrrch0hDzo6Srt=w240-h480-rw",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          if (index == selectCategoryItem)
                            Container(
                              width: double.infinity,
                              color: Colors.grey.withOpacity(0.8),
                            ),
                          Text(
                            category.name.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 200,
                ),
                itemCount: selectedProducts.length,
                itemBuilder: (ctx, index) {
                  var product = selectedProducts[index];
                  return GestureDetector(
                    onTap: (){
                      selectGridItem = index;
                      setState(() {

                      });
                    },
                    child: SizedBox(
                      height: 500,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: selectGridItem == index
                                ? Colors.green
                                : Colors.transparent,
                            width: 5,
                          ),
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              product.image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 100,
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.name),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectGridItem == index
                                            ? Colors.green
                                            : null,
                                      ),
                                      onPressed: () {
                                        selectGridItem = index;
                                        setState(() {

                                        });
                                      },
                                      child: selectGridItem == index
                                          ? const Icon(Icons.check)
                                          : const Text("Select"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

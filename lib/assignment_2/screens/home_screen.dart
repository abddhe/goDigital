import 'package:first_project/assignment_2/data.dart';
import 'package:first_project/assignment_2/models/post_model.dart';
import 'package:first_project/assignment_2/widgets/post_widget.dart';
import 'package:flutter/material.dart';
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<PostModel> posts = [];
    postData['data'].forEach((map) => posts.add(PostModel.fromMap(map)));
    return Scaffold(
      key: scaffoldKey,
      body: ListView.builder(itemCount: posts.length,itemBuilder: (ctx, index) => PostWidget(postModel: posts[index])),
    );
  }
}

import 'package:first_project/assignment_2/models/post_model.dart';
import 'package:first_project/assignment_2/widgets/buttons/like_button.dart';
import 'package:first_project/assignment_2/widgets/author_widget.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  final PostModel postModel;

  const PostWidget({super.key, required this.postModel});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late int commentsCount;

  @override
  void initState() {
    commentsCount = widget.postModel.comments.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: .5,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image.network(
                    widget.postModel.image,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, err, exp) => Container(
                      color: Colors.grey.shade400,
                      child: const Center(
                        child: Icon(
                          Icons.image,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                PositionedDirectional(
                  start: 10,
                  top: 10,
                  child: AuthorWidget(user: widget.postModel.user),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LikeButton(
                    isLiked: widget.postModel.isLiked,
                    comments: widget.postModel.comments,
                  ),
                  Text("$commentsCount Comments"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:first_project/assignment_2/models/comment_post.dart';
import 'package:first_project/assignment_2/models/user_model.dart';

class PostModel {
  String body;
  String image;
  bool isLiked;
  UserModel user;
  List<CommentModel> comments;

  PostModel({
    required this.body,
    required this.image,
    required this.isLiked,
    required this.user,
    required this.comments,
  });

  factory PostModel.fromMap(Map map) {
    List<CommentModel> comments = [];
    map['comments']
        .forEach((comment) => comments.add(CommentModel.fromMap(comment)));
    return PostModel(
      body: map['body'],
      image: map['image'],
      user: UserModel.fromMap(map['user']),
      isLiked: map['isLiked'],
      comments: comments,
    );
  }
}

import 'package:first_project/assignment_2/models/user_model.dart';

class CommentModel{
  String body;
  UserModel user;
  CommentModel({required this.body,required this.user});
  factory CommentModel.fromMap(Map map){
    return CommentModel(body: map['body'], user: UserModel.fromMap(map['user']));
  }
}
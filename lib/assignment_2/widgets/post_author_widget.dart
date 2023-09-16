import 'package:first_project/assignment_2/models/user_model.dart';
import 'package:flutter/material.dart';

class PostAuthorWidget extends StatelessWidget {
  final UserModel user;

  const PostAuthorWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(user.avatar),
        ),
        const SizedBox(width: 10,),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            user.displayName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:first_project/assignment_2/models/user_model.dart';
import 'package:flutter/material.dart';

class AuthorWidget extends StatelessWidget {
  final UserModel user;
  final String? body;
  final String type;

  const AuthorWidget({super.key, required this.user, this.body, this.type = 'post'});

  @override
  Widget build(BuildContext context) {
    late Color displayNameColor ;
    if(type =='post') {
      displayNameColor = Colors.white;
    } else {
      displayNameColor = Colors.black54;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(user.avatar),
        ),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3,bottom: 5),
              child: Text(
                user.displayName,
                style:  TextStyle(
                  color: displayNameColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              body ?? '',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        )
      ],
    );
  }
}

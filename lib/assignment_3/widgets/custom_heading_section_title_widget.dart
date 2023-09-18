import 'package:flutter/material.dart';

class CustomHeadingSectionTitleWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isOptional;

  const CustomHeadingSectionTitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.isOptional = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "$title ${isOptional ? "(اختياري)" : ""}",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsetsDirectional.only(start: 5),
        child: Text(
          subTitle,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

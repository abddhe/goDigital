import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final bool isLiked;

  const LikeButton({super.key, required this.isLiked});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  static const double containerSize = 20.0;
  late bool _isFav;

  @override
  void initState() {
    _isFav = widget.isLiked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFav = !_isFav;
        });
      },
      child: Row(children: [
        SizedBox(
          width: containerSize,
          height: containerSize,
          child: FlareActor("assets/Favorite.flr",
              shouldClip: false,
              // Play the animation depending on the state.
              animation: _isFav ? "Favorite" : "Unfavorite" //_animationName
              ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          "Like",
          style: TextStyle(fontSize: 13, color: Colors.black45),
        ),
      ]),
    );
  }
}

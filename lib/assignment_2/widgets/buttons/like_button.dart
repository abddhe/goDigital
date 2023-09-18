import 'package:first_project/assignment_2/models/comment_post.dart';
import 'package:first_project/assignment_2/models/user_model.dart';
import 'package:first_project/assignment_2/screens/home_screen.dart';
import 'package:first_project/assignment_2/widgets/author_widget.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final bool isLiked;
  final List<CommentModel> comments;

  const LikeButton({super.key, required this.isLiked, required this.comments});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  static const double containerSize = 20.0;
  late bool _isFav;
  var commentBody = '';
  late AnimationController _controller;
  final _duration = const Duration(milliseconds: 500);

  @override
  void didUpdateWidget(LikeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.duration = _duration;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _isFav = widget.isLiked;
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.comments);
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
        GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  transitionAnimationController: _controller,
                  context: context,
                  builder: (ctx) {
                    return SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(ctx).size.height * .5,
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: ListView.builder(
                                  itemCount: widget.comments.length,
                                  itemBuilder: (ctx, index) {
                                    final comment = widget.comments[index];
                                    return Card(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: [
                                            AuthorWidget(
                                              user: comment.user,
                                              body: comment.body,
                                              type: 'comment',
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Write your comment...",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      commentBody = value;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      if (commentBody.isEmpty) {
                                        // ScaffoldMessenger.of(scaffoldKey.currentState)
                                        //     .showSnackBar(
                                        //   const SnackBar(
                                        //     content: Text(
                                        //         "You can not send empty comment."),
                                        //     duration: Duration(seconds: 1),
                                        //   ),
                                        // );
                                        return;
                                      }
                                      setState(() {
                                        widget.comments.add(
                                          CommentModel(
                                            body: commentBody,
                                            user: UserModel(
                                                displayName:
                                                    "Abdullah A. Dheir",
                                                avatar: ""),
                                          ),
                                        );
                                      });
                                    },
                                    child: const Icon(Icons.send)),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            },
            child: const Icon(Icons.mode_comment_outlined)),
      ]),
    );
  }
}

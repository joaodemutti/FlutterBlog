import 'package:a0/pages/post.dart';
import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => PostsState();
}

class PostsState extends State<Posts> {
  final GlobalKey<AnimatedListState> _listkey = GlobalKey<AnimatedListState>();

  void ItemSelected(index, context) {
    Navigator.push(context, PostRoute(index));
  }

  void LoadPosts() async {
    _listkey.currentState!.removeAllItems((context, animation) => Container());
    InsertItems(length: 10);
  }

  void InsertItems({int index = 0, int length = 1}) {
    for (int i = 0; i < length; i++)
      Future.delayed(Duration(milliseconds: 100 * i),
          () => _listkey.currentState!.insertItem(index + i));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((t) {
      InsertItems(length: 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      clipBehavior: Clip.hardEdge,
      child: AnimatedList(
        clipBehavior: Clip.hardEdge,
        primary: false,
        shrinkWrap: true,
        key: _listkey,
        itemBuilder: (context, index, animation) => SlideTransition(
          position: animation.drive<Offset>(
            Tween<Offset>(
              begin: Offset(1, 0),
              end: Offset(0, 0),
            ),
          ),
          child: Card(
            color: Colors.grey,
            child: InkWell(
              onTap: () => ItemSelected(index, context),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Wrap(
                    spacing: 5,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Hero(
                        tag: 'post$index',
                        child: Icon(Icons.photo),
                      ),
                      Text('$index')
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

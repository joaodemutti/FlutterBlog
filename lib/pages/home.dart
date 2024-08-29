
import 'package:a0/widgets/panel.dart';
import 'package:a0/widgets/posts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState () => HomeState();
}

class HomeState extends State<HomePage>{
  GlobalKey<PostsState> _posts = GlobalKey<PostsState>();
  List<Widget> _home = [];

  LoadPosts()async{
    setState(() {
      _home = [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Text('Paineis',textAlign: TextAlign.center,)),
        Wrap(
          spacing: 20,
          alignment: WrapAlignment.center,
          children:[
          Panel('panel1'),
          Panel('panel2'),
          ]),
          SizedBox(height: 30,),
          Container(child:Posts(key: _posts,))
      ]; // posts
      _posts.currentState!.LoadPosts();
    });
  }

  @override
  void initState() {
    super.initState();
    LoadPosts();
  }
  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: ()async{
        await Future.delayed(Duration(milliseconds: 1000));
        await LoadPosts();
      },
      child: ListView(children: _home)
      );
  }

}
import 'package:a0/widgets/topbar.dart';
import 'package:flutter/material.dart';

PostRoute(index) => MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: TopBar(context, '$index'),
          body: Center(
            child: ClipRect(
              child: Hero(
                tag: 'post$index',
                child: Icon(Icons.photo,size: 100,),
              ),
            ),
          ),
        );
      },
    );

import 'package:a0/widgets/avatar.dart';
import 'package:flutter/material.dart';

AppBar TopBar(context,title)=> AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(children:<Widget>[Avatar(),SizedBox(width: 10),Text(title)],),
      );
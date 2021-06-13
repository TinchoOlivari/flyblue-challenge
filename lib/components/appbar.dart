import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      leading: CupertinoButton(
        child: Icon(CupertinoIcons.back, color: Colors.white),
        onPressed: () {},
      ),
      actions: [
        Container(
          padding: EdgeInsets.only(right: 12),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.bell, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.8), Colors.transparent],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
      ),
    );
  }
}

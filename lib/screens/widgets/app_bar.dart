import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Text('WRC 2020'),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64);
}

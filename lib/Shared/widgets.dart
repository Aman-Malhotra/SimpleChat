import 'package:flutter/material.dart';
import 'package:holmusk_task/Constants/constTheme.dart';

Widget button({String text, Function onTap, BuildContext context}) {
  return FlatButton(
    child: Text(
      text,
      style: theme(context)
          .textTheme
          .headline5
          .copyWith(fontWeight: FontWeight.w600),
    ),
    onPressed: onTap,
  );
}

AppBar appBar({
  String text,
  BuildContext context,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      text,
      style: theme(context)
          .textTheme
          .headline5
          .copyWith(fontWeight: FontWeight.w500),
    ),
    elevation: 0.0,
  );
}

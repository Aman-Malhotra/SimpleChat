import 'package:flutter/material.dart';

void modalBottomSheetMenu(String message, BuildContext context,
    {bool error = false}) {
  showModalBottomSheet(
      elevation: 10.0,
      context: context,
      builder: (builder) {
        return Material(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.all(20.0),
                decoration: new BoxDecoration(
                  color: (error) ? Colors.red : Theme.of(context).cardColor,
                ),
                child: new Center(
                  child: new Text(
                    message,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

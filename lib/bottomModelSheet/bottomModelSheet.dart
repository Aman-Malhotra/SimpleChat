import 'package:flutter/material.dart';
import 'package:holmusk_task/Constants/constTheme.dart';

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
                  color: (error) ? Colors.red : theme(context).cardColor,
                ),
                child: new Center(
                  child: new Text(
                    message,
                    style: theme(context).textTheme.headline5.copyWith(
                      color: !(error) ? Colors.red :theme(context).cardColor,
                    ),
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

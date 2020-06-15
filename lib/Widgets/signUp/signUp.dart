import 'package:flutter/material.dart';
import 'package:holmusk_task/Constants/constTheme.dart';
import 'package:provider/provider.dart';
import './signUp_pm.dart';

// Copy the line below and add as a child where you want to use SignUp Widget
// ChangeNotifierProvider(create:(context)=>SignUpPm(),child: SignUp())

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignUpPm signUpPm = Provider.of<SignUpPm>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SignUp",
          style: theme(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.w600, color: theme(context).canvasColor),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: signUpPm.name,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextFormField(
              obscureText: true,
              controller: signUpPm.pass,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            FlatButton(
              child: Text("Sign Up"),
              color: theme(context).primaryColor,
              onPressed: signUpPm.signUp,
            ),
          ],
        ),
      ),
    );
  }
}

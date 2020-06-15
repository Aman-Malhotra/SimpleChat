import 'package:flutter/material.dart';
import 'package:holmusk_task/Constants/constTheme.dart';
import 'package:provider/provider.dart';
import './signIn_pm.dart';

// Copy the line below and add as a child where you want to use SignIn Widget
// ChangeNotifierProvider(create:(context)=>SignInPm(),child: SignIn())

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignInPm signInPm = Provider.of<SignInPm>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "SignIn",
          style: theme(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.w600),
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
              controller: signInPm.name,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextFormField(
              obscureText: true,
              controller: signInPm.pass,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            FlatButton(
              child: Text("Login"),
              color: theme(context).primaryColor,
              onPressed: signInPm.signIn,
            ),
            FlatButton(
              child: Text("Create Account"),
              color: theme(context).primaryColor,
              onPressed: signInPm.openCreateAccount,
            ),
          ],
        ),
      ),
    );
  }
}

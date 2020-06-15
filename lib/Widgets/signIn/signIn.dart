import 'package:flutter/material.dart';
import 'package:holmusk_task/Constants/constTheme.dart';
import 'package:holmusk_task/Shared/widgets.dart';
import 'package:provider/provider.dart';
import './signIn_pm.dart';

// Copy the line below and add as a child where you want to use SignIn Widget
// ChangeNotifierProvider(create:(context)=>SignInPm(),child: SignIn())

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignInPm signInPm = Provider.of<SignInPm>(context);
    InputDecoration inputDecoration(String hint, String label) {
      return InputDecoration(
        hintText: hint,
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      );
    }

    return Scaffold(
      appBar: appBar(context: context, text: "Sign In"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
                controller: signInPm.name,
                decoration: inputDecoration("Enter your username", "Username")),
            TextFormField(
              obscureText: true,
              controller: signInPm.pass,
              decoration: inputDecoration("Enter your Password", "Password"),
            ),
            button(
              context: context,
              onTap: signInPm.signIn,
              text: "Sign In",
            ),
            button(
              context: context,
              onTap: signInPm.openCreateAccount,
              text: "Create New Account",
            ),
          ],
        ),
      ),
    );
  }
}

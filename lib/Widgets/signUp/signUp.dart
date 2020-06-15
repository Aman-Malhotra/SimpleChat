import 'package:flutter/material.dart';
import 'package:holmusk_task/Constants/constTheme.dart';
import 'package:holmusk_task/Shared/widgets.dart';
import 'package:provider/provider.dart';
import './signUp_pm.dart';

// Copy the line below and add as a child where you want to use SignUp Widget
// ChangeNotifierProvider(create:(context)=>SignUpPm(),child: SignUp())

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignUpPm signUpPm = Provider.of<SignUpPm>(context);
    InputDecoration inputDecoration(String hint, String label) {
      return InputDecoration(
        hintText: hint,
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      );
    }

    return Scaffold(
      appBar: appBar(context: context, text: "Sign Up"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
                controller: signUpPm.name,
                decoration: inputDecoration("Enter your username", "Username")),
            TextFormField(
              obscureText: true,
              controller: signUpPm.pass,
              decoration: inputDecoration("Enter your Password", "Password"),
            ),
            button(
              context: context,
              onTap: signUpPm.signUp,
              text: "Sign Up",
            ),
          ],
        ),
      ),
    );
  }
}

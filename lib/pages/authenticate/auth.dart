import 'package:recies/pages/authenticate/signIn.dart';
import 'package:recies/pages/authenticate/signUp.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  bool accountFlag = true;
  toggleAccountState() {
    setState(() => accountFlag = !accountFlag);
  }

  @override
  Widget build(BuildContext context) {
    if (accountFlag) {
      return SignInPage(toggle: toggleAccountState);
    } else {
      return SignUpPage(toggle: toggleAccountState);
    }
  }
}

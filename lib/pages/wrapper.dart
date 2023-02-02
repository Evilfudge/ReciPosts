import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recies/models/reciposts_user.dart';
import 'package:recies/pages/home/home.dart';
import 'package:recies/pages/authenticate/auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<RecipostsUser?>(context);

    if (user == null) {
      return Auth();
    } else {
      return HomePage();
    }
  }
}

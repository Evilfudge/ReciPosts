import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recies/colors/colorPallete.dart';
import 'package:recies/dimensions.dart';
import 'package:recies/models/username.dart';
import 'package:recies/widgets/BText.dart';
import 'package:recies/controller/usernamecollections.dart';
import 'package:provider/provider.dart';

import '../../controller/authenticate.dart';
import 'homebody.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String? name = user?.displayName;
    return StreamProvider<List<Username>>.value(
      value: UsernameCollections().usernames,
      initialData: const [],

      child: Scaffold(
        //===========================HEADER SECTION===========================
        appBar: AppBar(
          //===========================GREETING===========================
          //(FirebaseAuth.instance.currentUser?.uid).toString()
          title: BText(text: 'Welcome,$name' ?? '', color: ColorPallete.secondary),
          elevation: 0,
          toolbarHeight: 70,
          actions: [
            //===========================HEADER SEARCH===========================
            //HomeUsername(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height10),
              width: Dimensions.width45,
              height: Dimensions.height45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: ColorPallete.prime,
              ),
              child: IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                  iconSize: Dimensions.iconSizeDefault,
                  onPressed: () {print('object');}
              ),
            ),
            //===========================HEADER LOGOUT===========================
            Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height10),
              width: Dimensions.width45,
              height: Dimensions.height45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: ColorPallete.prime,
              ),
              child: IconButton(
                  icon: const Icon(Icons.person),
                  color: Colors.white,
                  iconSize: Dimensions.iconSizeDefault,
                  onPressed: () async => await _auth.signOut()
              ),
            )
          ],

        ),
        //===========================BODY SECTION===========================
        body: Column(
          children: const [Expanded(child: SingleChildScrollView(child: HomeBody()))],
        ),
      ),
    );
  }
}

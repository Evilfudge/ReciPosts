import 'package:flutter/material.dart';
import 'package:recies/colors/colorPallete.dart';
import 'package:recies/dimensions.dart';
import 'package:recies/widgets/BText.dart';

import '../../controller/authenticate.dart';
import 'homebody.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.paddingheight15),
            padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
            //===========================HEADER SECTION===========================
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //===========================GREETING===========================
                BText(text: "Welcome Back!", color: ColorPallete.secondary),
                //===========================HEADER SEARCH ICON===========================
                Container(
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
                    onPressed: () {print('object');}),
                ),
                Container(
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
          ),
          const Expanded(child: SingleChildScrollView(
            //===========================METHOD TO CALL HOME PAGE BODY===========================
            child: HomeBody(),
          )),
        ],
      ),
    );
  }
}

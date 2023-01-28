import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recies/colors/colorPallete.dart';
import 'package:recies/diminsions.dart';
import 'package:recies/widgets/BText.dart';

import 'HomeBody.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Diminsions.height45, bottom: Diminsions.paddingheight15),
              padding: EdgeInsets.only(left: Diminsions.width20, right: Diminsions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BText(text: "Welcome Back!", color: colorPallete.secondary),

                    ],
                  ),
                  Center(
                    child: Container(
                      width: Diminsions.width45,
                      height: Diminsions.height45,
                      child: Icon(Icons.search,color: Colors.white, size: Diminsions.iconSizeDefault,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Diminsions.radius15),
                        color: colorPallete.prime,
                      ),
                    ),
                  )
                ],
              ),
            ),

          ),
          HomeBody(),
        ],
      ),
    );
  }
}

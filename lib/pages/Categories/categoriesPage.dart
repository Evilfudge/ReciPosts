import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recies/pages/Home/HomePage.dart';

import '../../diminsions.dart';
import '../../widgets/BText.dart';
import '../../widgets/appIcons.dart';
import '../../widgets/recipyTitle.dart';
import '../recipy_page/foodRecipy.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Diminsions.height30,),
                Container(
                  margin: EdgeInsets.only(left: Diminsions.width30),
                  child: Row(
                    children: [
                      //===========================ROUTE PART GO TO MAINPAGE===========================
                      GestureDetector(
                          onTap: (){
                            Get.to(() => HomePage());
                          },
                    child: Icon(Icons.arrow_back)),
                      SizedBox(width: Diminsions.width10),
                      //===========================CATEGORY NAME===========================
                      BText(text: "Category name in here", size: Diminsions.font26, color: Colors.black87,)
                    ],
                  ),
                ),
                //list of recent
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      //===========================ROUTE PART GO TO RECIPYPAGE===========================
                      return GestureDetector(
                        onTap: (){
                          Get.to(() => FoodRecipy());
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: Diminsions.width20, right: Diminsions.width20, bottom: Diminsions.height10),
                          child: Row(
                            children: [
                              //===========================RECIPY IMAGE===========================
                              Container(
                                width: Diminsions.imgSize,
                                height: Diminsions.imgSize,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(Diminsions.radius20), bottomLeft: Radius.circular(Diminsions.radius20)),
                                    color: Colors.white30,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        //===========================RECIPY IMAGE DIRECTORY===========================
                                        image: AssetImage("assets/image/food1.jpeg")
                                    )
                                ),
                              ),
                              //recipy text
                              Expanded(
                                  child: Container(
                                    height: Diminsions.textContainerSize,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(Diminsions.radius20), bottomRight: Radius.circular(Diminsions.radius20)),
                                        color: Colors.white
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: Diminsions.width10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        //===========================RECIPY DETAILS===========================
                                        children: [
                                          RecipyTitle(text: "burger")
                                        ],
                                      ),
                                    ),

                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ],
      )
    );
  }
}

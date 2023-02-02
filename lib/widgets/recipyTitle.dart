import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/colorPallete.dart';
import '../diminsions.dart';
import 'BText.dart';
import 'IconAndText.dart';
import 'SText.dart';
//=========================== THIS SECTION IS USED TO PASS A WIDGET THAT CONTAIN THE TITLE OF THE FOOD, TIME TAKES TO BE PREPARED AND THE RANK OF IT ===========================
class RecipyTitle extends StatelessWidget {
  final String text;
  const RecipyTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BText(text: text, size: Diminsions.font26, color: Colors.black,),
        SizedBox(height: Diminsions.height10,),
        Row(
          children: [
            SText(text: "number of recipies"),

          ],
        ),
        SizedBox(height: Diminsions.height20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            IconAndText(icon: Icons.circle_sharp, text: "Easy", color: ColorPallete.light, iconColor: ColorPallete.prime),
            IconAndText(icon: Icons.access_time_rounded, text: "12 min", color: ColorPallete.light, iconColor: ColorPallete.prime)
          ],
        )
      ],
    );
  }
}

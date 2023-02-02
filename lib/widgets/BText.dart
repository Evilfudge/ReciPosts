import 'package:flutter/cupertino.dart';
import 'package:recies/dimensions.dart';
//===========================THIS CLASS IS USED TO PASS BIG TEXT BY DEFAULT, USER CAN PASS THE COLOR, SIZE, OVERFLOW, AND FONT WEIGHT AS WELL===========================
class BText extends StatelessWidget {

   Color? color;
  final String text;
  double size;
  TextOverflow overflow;
   FontWeight fontWeigt ;

  BText({Key? key, this.color = const Color(0xFFFFE15D), required this.text, this.size = 0,this.overflow = TextOverflow.ellipsis, this.fontWeigt = FontWeight.w400}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: "Roboto",
        fontSize: size == 0 ? Dimensions.font20 : size,
        color: color,
        fontWeight: fontWeigt
      ),
    );
  }
}

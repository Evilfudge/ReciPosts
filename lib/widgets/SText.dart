import 'package:flutter/cupertino.dart';
// =========================== THIS CLASS IS CALLED TO PASS A SMALL TEXT BY DEFAULT, USER CAN PASS SIZE, COLOR,  AND HEIGHT BETWEEN EACH LINE ===========================
class SText extends StatelessWidget {

  Color? color;
  final String text;
  double size = 12;
  double height;

  SText({Key? key, this.color = const Color(0xFFccc7c5), required this.text, this.size = 12, this.height = 1.2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: size,
          color: color,
          height: height
      ),
    );
  }
}

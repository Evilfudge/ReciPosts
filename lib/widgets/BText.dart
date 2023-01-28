import 'package:flutter/cupertino.dart';
import 'package:recies/diminsions.dart';

class BText extends StatelessWidget {

   Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BText({Key? key, this.color = const Color(0xFFFFE15D), required this.text, this.size = 0,this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size == 0 ? Diminsions.font20 : size,
        color: color,
        fontWeight: FontWeight.w400
      ),
    );
  }
}

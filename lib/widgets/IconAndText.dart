import 'package:flutter/cupertino.dart';
import 'package:recies/diminsions.dart';
import 'package:recies/widgets/SText.dart';
//=========================== THIS CLASS CAN BE USED TO PASS TEXT AND ICON ALONG WITH IT, MAKE THINGS EASIER IN A WAY I GUESS ===========================
class IconAndText extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;

  const IconAndText({Key? key,
                      required this.icon,
                      required this.text,
                      required this.color,
                      required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Diminsions.iconSizeDefault,),
        SizedBox(width: 5,),
        SText(text: text, color: color),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:recies/diminsions.dart';

class AppIcons extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color bg;
  final double size;

   AppIcons({Key?  key,
            required this.icon,
            this.color = const Color(0xFF756d54),
            this.bg = const Color(0xFFfcf4e4),
            this.size = 40})
            : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: bg
      ),
      child: Icon(
        icon,
        color: color,
        size: Diminsions.iconSize16,
      ),
    );
  }
}

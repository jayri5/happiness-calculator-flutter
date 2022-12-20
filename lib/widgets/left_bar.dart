import 'package:helloworld/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/constants/app_constants.dart';

class LeftBar extends StatelessWidget {
  final double barWidth;
  const LeftBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext build) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              color: accentHexColor),
        ),
      ],
    );
  }
}

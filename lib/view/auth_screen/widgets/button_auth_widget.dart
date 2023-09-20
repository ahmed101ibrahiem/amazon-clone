import 'package:flutter/material.dart';

import '../../../utils/colors.dart';



class ButtonAuthWidget extends StatelessWidget {
  const ButtonAuthWidget({
    super.key,
    required this.width,
    required this.height,
    required this.style,
  });

  final double width;
  final double height;
  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: amber,
        // padding: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        minimumSize: Size(width,height * 0.058),
      ),
      onPressed: (){}, child: Text(
      'Continue',style: style.displaySmall,
    ),);
  }
}

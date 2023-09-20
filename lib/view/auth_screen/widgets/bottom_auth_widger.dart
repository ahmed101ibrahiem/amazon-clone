import 'package:flutter/material.dart';

import '../../../constants/common_functions.dart';
import '../../../utils/colors.dart';


class BottomAuthScreen extends StatelessWidget {
  const BottomAuthScreen({
    super.key,
    required this.height,
    required this.style,
  });

  final double height;
  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // divider
        Container(
          height: 2,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [white,greyShade3,white])
          ),
        ),
        CommonFunctions.blankSpace(height*0.02, 0.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Condition of Use',style: style.bodySmall!.copyWith(color: blue),),
            Text('Privacy Notice',style: style.bodySmall!.copyWith(color: blue),),
            Text('Help',style: style.bodySmall!.copyWith(color: blue),),
          ],),
        CommonFunctions.blankSpace(height*0.01, 0.0),
        Text('© 1996-2023, Amazon.com, Inc.or its affiliates',style: style.labelSmall!.copyWith(
            color: grey
        ),),

      ],
    );
  }
}

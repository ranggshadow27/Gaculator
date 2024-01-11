import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/fonts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor2,
      elevation: 0,
      centerTitle: true,
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Ga",
              style: fontBold.copyWith(
                color: orangeColor,
                fontSize: 16.0,
              ),
            ),
            TextSpan(
              text: "culator",
              style: fontBold.copyWith(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

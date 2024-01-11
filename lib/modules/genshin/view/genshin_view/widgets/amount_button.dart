import 'package:flutter/material.dart';
import 'package:gaculator/constants/colors.dart';

import '../../../../../constants/fonts.dart';

class AmountButton extends StatelessWidget {
  const AmountButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
  });

  final String text;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: secondaryColor,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: SizedBox(
          width: 35,
          height: 50,
          child: Center(
            child: Text(
              text,
              style: fontMedium.copyWith(
                color: color,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

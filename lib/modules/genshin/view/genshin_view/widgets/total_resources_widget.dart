import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/fonts.dart';

class GTotalResource extends StatelessWidget {
  const GTotalResource({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: backgroundColor2,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 35),
        child: Column(
          children: [
            Text(
              "18.900",
              style: fontBold.copyWith(
                fontSize: 40,
                color: orangeColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("145x Pulls", style: fontMedium.copyWith(fontSize: 12.0)),
                Text("Primogems", style: fontRegular.copyWith(fontSize: 12.0)),
                Text("4.5 Pities", style: fontMedium.copyWith(fontSize: 12.0)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gaculator/modules/genshin/controller/genshin_controller.dart';
import 'package:gaculator/utils/utils.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/fonts.dart';
import 'amount_button.dart';

class SpiralAbbysTile extends StatelessWidget {
  const SpiralAbbysTile({super.key, required this.controller});

  final GenshinController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35, left: 35, top: 10, bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .165,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Floor Clear",
                    style: fontRegular,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  AutoSizeText(
                    "Spiral Abbys",
                    style: fontBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  AutoSizeText(
                    "Clear Times",
                    style: fontRegular,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
            SizedBox(
              child: Column(
                children: [
                  AmountButton(
                    onTap: () => controller.increaseAmout("abbyssStars"),
                    text: "+",
                    color: greenColor,
                  ),
                  const SizedBox(height: 10),
                  AmountButton(
                    onTap: () => controller.increaseAmout("abbyssClear"),
                    text: "+",
                    color: greenColor,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 2),
            SizedBox(
              child: Column(
                children: [
                  Text(
                    controller.abbyssStars.toString(),
                    style: fontBold.copyWith(
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    controller.abbyssClear.toString(),
                    style: fontBold.copyWith(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 2),
            SizedBox(
              child: Column(
                children: [
                  AmountButton(
                    onTap: () => controller.decreaseAmout("abbyssStars"),
                    text: "-",
                    color: redColor,
                  ),
                  const SizedBox(height: 10),
                  AmountButton(
                    onTap: () => controller.decreaseAmout("abbyssClear"),
                    text: "-",
                    color: redColor,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
            SizedBox(
              width: MediaQuery.of(context).size.width * .105,
              child: AutoSizeText(
                Utils().numFormatter.format(controller.abbyssIncome),
                textAlign: TextAlign.right,
                style: fontBold.copyWith(fontSize: 18.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}

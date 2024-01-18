import 'package:flutter/material.dart';
import 'package:gaculator/modules/genshin/controller/genshin_controller.dart';
import 'package:gaculator/utils/utils.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/fonts.dart';

class GTotalResource extends StatelessWidget {
  const GTotalResource({
    super.key,
    required this.controller,
  });

  final GenshinController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor2,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 35),
      child: Column(
        children: [
          Text(
            Utils().numFormatter.format(controller.savingOverall),
            style: fontBold.copyWith(
              fontSize: 40,
              color: orangeColor,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  child: Text(
                    "${controller.overallPulls}x Pulls",
                    style: fontMedium.copyWith(fontSize: 12.0),
                  ),
                ),
                Center(
                  child: Text("Primogems", style: fontRegular.copyWith(fontSize: 12.0)),
                ),
                Positioned(
                  right: 0,
                  child: Text(
                    "${controller.pitiesOverall.toStringAsFixed(1)} Pity(s)",
                    style: fontMedium.copyWith(fontSize: 12.0),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

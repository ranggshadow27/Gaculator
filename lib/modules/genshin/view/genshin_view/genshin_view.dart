import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaculator/constants/colors.dart';
import 'package:gaculator/modules/genshin/controller/genshin_controller.dart';
import 'package:gaculator/constants/fonts.dart';
import 'package:gaculator/modules/genshin/view/genshin_view/widgets/total_resources_widget.dart';
import 'package:gaculator/modules/genshin/view/genshin_view/widgets/welkin_button.dart';
import 'package:gaculator/utils/utils.dart';

import 'widgets/date_picker_section.dart';
import 'widgets/appbar.dart';
import 'widgets/income_tile.dart';
import 'widgets/spiral_abbyss_tile.dart';

class GenshinView extends StatefulWidget {
  const GenshinView({super.key});

  Widget build(BuildContext context, GenshinController controller) {
    controller.view = this;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size(20, 60),
        child: MyAppBar(),
      ),
      body: ListView(
        children: [
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: secondaryColor),
            child: Center(
              child: Text("Genshin Impact", style: fontMedium),
            ),
          ),
          GTotalResource(controller: controller),
          GDatePicker(controller: controller),
          // const Divider(),
          WelkinButton(
            icon: controller.isWelkinActive ? FontAwesomeIcons.check : FontAwesomeIcons.xmark,
            boxColor: primaryColor.withOpacity(controller.isWelkinActive ? 1 : .6),
            textColor: textColor.withOpacity(controller.isWelkinActive ? 1 : .6),
            iconColor: controller.isWelkinActive ? greenColor : redColor,
            onTap: () {
              controller.welkinSwitch();
            },
          ),
          SpiralAbbysTile(
            controller: controller,
          ),
          IncomeTile(
            title: "Paimon Shop",
            value: "paimonShop",
            total: Utils().numFormatter.format(controller.paimonShop['total']),
            amount: controller.paimonShop['amount'].toString(),
            controller: controller,
          ),
          IncomeTile(
            title: "Battle Pass",
            value: "battlePass",
            total: Utils().numFormatter.format(controller.battlePass['total']),
            amount: controller.battlePass['amount'].toString(),
            controller: controller,
          ),
          IncomeTile(
            title: "Stream Codes",
            value: "streamCodes",
            total: Utils().numFormatter.format(controller.streamCodes['total']),
            amount: controller.streamCodes['amount'].toString(),
            controller: controller,
          ),
          IncomeTile(
            title: "Maintenance Comp",
            value: "mtCompensation",
            total: Utils().numFormatter.format(controller.mtCompensation['total']),
            amount: controller.mtCompensation['amount'].toString(),
            controller: controller,
          ),
          IncomeTile(
            title: "Bug Compensation",
            value: "bugCompensation",
            total: Utils().numFormatter.format(controller.bugCompensation['total']),
            amount: controller.bugCompensation['amount'].toString(),
            controller: controller,
          ),
          IncomeTile(
            title: "Main Event",
            value: "mainEvent",
            total: Utils().numFormatter.format(controller.mainEvent['total']),
            amount: controller.mainEvent['amount'].toString(),
            controller: controller,
          ),
          IncomeTile(
            title: "Normal Events",
            value: "normalEvents",
            total: Utils().numFormatter.format(controller.normalEvents['total']),
            amount: controller.normalEvents['amount'].toString(),
            controller: controller,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            color: primaryColor,
            child: Center(
              child: Text(
                "©2024 Genshin Impact Primogems Calc",
                style: fontRegular.copyWith(
                  fontSize: 12.0,
                  color: textColor.withOpacity(.7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<GenshinView> createState() => GenshinController();
}

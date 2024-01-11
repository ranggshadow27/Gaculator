import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaculator/constants/colors.dart';
import 'package:gaculator/modules/genshin/controller/genshin_controller.dart';
import 'package:gaculator/constants/fonts.dart';
import 'package:gaculator/modules/genshin/view/genshin_view/widgets/total_resources_widget.dart';
import 'package:gaculator/modules/genshin/view/genshin_view/widgets/welkin_button.dart';

import 'widgets/amount_button.dart';
import 'widgets/date_picker_section.dart';
import 'widgets/appbar.dart';

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
          const GTotalResource(),
          const GDatePicker(),
          // const Divider(),
          WelkinButton(
            icon: controller.isActive ? FontAwesomeIcons.check : FontAwesomeIcons.xmark,
            boxColor: primaryColor.withOpacity(controller.isActive ? 1 : .6),
            textColor: textColor.withOpacity(controller.isActive ? 1 : .6),
            iconColor: controller.isActive ? greenColor : redColor,
            onTap: () {
              controller.welkinSwitch();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 8,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Clear Stars",
                                style: fontRegular,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Spiral Abbys",
                                style: fontBold,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Clear Times",
                                style: fontRegular,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
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
                        Expanded(
                          flex: 2,
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
                        Expanded(
                          flex: 2,
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
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      controller.abbyssIncome.toString(),
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      style: fontBold.copyWith(
                        fontSize: 16.0,
                      ),
                    ),
                  )
                ],
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

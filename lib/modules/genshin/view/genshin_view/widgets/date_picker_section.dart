import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:gaculator/modules/genshin/controller/genshin_controller.dart';
import 'package:gaculator/utils/utils.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/fonts.dart';
import 'dashboard_tile.dart';

class GDatePicker extends StatelessWidget {
  const GDatePicker({
    super.key,
    required this.controller,
  });

  final GenshinController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 36, left: 36, top: 20, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              controller.dates.isEmpty || controller.dates[1] == null
                  ? Text("Select a Date", style: fontMedium)
                  : Text("Total day(s) : ", style: fontMedium),
              controller.dates.isEmpty || controller.dates[1] == null
                  ? const SizedBox()
                  : Text("${controller.daysTotal.toString()} day(s)", style: fontMedium),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: orangeColor,
                  fixedSize: const Size(50, 55),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () {
                  controller.showCalendar();
                },
                child: const Icon(
                  Icons.date_range,
                  color: backgroundColor,
                ),
              ),
              const SizedBox(width: 14),
              controller.dates.isEmpty || controller.dates[1] == null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "No date selected!",
                          style: fontMedium.copyWith(
                            color: orangeColor,
                          ),
                        ),
                        Text(
                          "Please select Start and End Date",
                          style: fontRegular,
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("From", style: fontRegular.copyWith(fontSize: 12.0)),
                        Text(
                          Utils().dateFormat(
                            controller.dates.isEmpty ? "-" : controller.dates[0]!,
                          ),
                          style: fontSemiBold.copyWith(color: orangeColor),
                        ),
                      ],
                    ),
              const Spacer(),
              controller.dates.isEmpty || controller.dates[1] == null
                  ? const SizedBox()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("End", style: fontRegular.copyWith(fontSize: 12.0)),
                        Text(
                          Utils().dateFormat(
                            controller.dates.isEmpty ? "-" : controller.dates[1]!,
                          ),
                          style: fontSemiBold.copyWith(color: orangeColor),
                        ),
                      ],
                    )
            ],
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              mainAxisExtent: 90,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              Map<String, dynamic> tilesData = {
                'title': [
                  "Current Primogems",
                  "Current Fates",
                  "Current Pities",
                  "Daily Commisions"
                ],
                'currency': [
                  Utils().numFormatter.format(controller.currentResource['primogems']),
                  Utils().numFormatter.format(controller.currentResource['fates']),
                  Utils().numFormatter.format(controller.currentResource['pities']),
                  Utils().numFormatter.format(controller.dailyCommision),
                ],
                'onTap': [
                  () {
                    controller.showInputDialog(
                      callback: () {
                        controller.inputCurrentValue('primogems');
                      },
                      hintText: "Input your Current Primogems",
                      controller: controller.primogemsC,
                    );
                  },
                  () {
                    controller.showInputDialog(
                      callback: () {
                        controller.inputCurrentValue('fates');
                      },
                      hintText: "Input your Current Fates",
                      controller: controller.fatesC,
                    );
                  },
                  () {
                    controller.showInputDialog(
                      callback: () {
                        controller.inputCurrentValue('pities');
                      },
                      hintText: "Input your Current Pities",
                      controller: controller.pitiesC,
                    );
                  },
                  () {},
                ],
                'isTappable': [
                  true,
                  true,
                  true,
                  false,
                ]
              };

              return DashboardTile(
                title: tilesData['title'][index],
                currency: tilesData['currency'][index].toString(),
                onTap: tilesData['onTap'][index],
                isTappable: tilesData['isTappable'][index],
              );
            },
          ),
        ],
      ),
    );
  }
}

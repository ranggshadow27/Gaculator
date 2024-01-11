import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/fonts.dart';
import 'dashboard_tile.dart';

class GDatePicker extends StatelessWidget {
  const GDatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pick a Date", style: fontMedium),
                Text("40 days", style: fontMedium),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: orangeColor,
                    fixedSize: const Size(50, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.date_range,
                    color: backgroundColor,
                  ),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Start", style: fontRegular.copyWith(fontSize: 12.0)),
                    Text("04 - Jan - 2024", style: fontSemiBold.copyWith(color: orangeColor)),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("End", style: fontRegular.copyWith(fontSize: 12.0)),
                    Text("04 - Jan - 2024", style: fontSemiBold.copyWith(color: orangeColor)),
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
                    10.284,
                    213,
                    42,
                    4.825,
                  ]
                };

                return DashboardTile(
                  title: tilesData['title'][index],
                  currency: tilesData['currency'][index].toString(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

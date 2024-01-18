import 'package:flutter/material.dart';
import 'package:gaculator/constants/colors.dart';
import 'package:gaculator/modules/genshin/controller/genshin_controller.dart';

import '../../../../../constants/fonts.dart';
import 'amount_button.dart';

class IncomeTile extends StatelessWidget {
  const IncomeTile({
    super.key,
    required this.controller,
    required this.title,
    required this.value,
    required this.total,
    required this.amount,
  });

  final GenshinController controller;
  final String amount;
  final String title;
  final String value;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35, left: 35, top: 0, bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 46,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .20,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: fontMedium,
                        ),
                      ),
                    ),
                  );
                },
                child: Text(
                  title,
                  style: fontMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(width: 4),
            AmountButton(
                text: "+",
                onTap: () {
                  controller.increaseAmout(value);
                },
                color: greenColor),
            const SizedBox(width: 2),
            SizedBox(
              width: MediaQuery.of(context).size.width * .1,
              child: Center(
                child: Text(
                  amount,
                  style: fontBold.copyWith(fontSize: 18.0),
                ),
              ),
            ),
            const SizedBox(width: 2),
            AmountButton(
                text: "-",
                onTap: () {
                  controller.decreaseAmout(value);
                },
                color: redColor),
            const SizedBox(width: 4),
            SizedBox(
              width: MediaQuery.of(context).size.width * .15,
              child: Text(
                total,
                textAlign: TextAlign.right,
                style: fontBold.copyWith(fontSize: 18.0),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

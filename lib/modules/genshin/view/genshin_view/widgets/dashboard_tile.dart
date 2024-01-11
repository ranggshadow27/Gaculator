import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/fonts.dart';

class DashboardTile extends StatelessWidget {
  const DashboardTile({
    super.key,
    required this.title,
    required this.currency,
  });

  final String title;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
      width: MediaQuery.of(context).size.width * .38,
      // height: MediaQuery.sizeOf(context).height * .1,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: fontRegular.copyWith(
              color: textColor.withOpacity(.6),
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            currency,
            style: fontMedium.copyWith(
              fontSize: 20.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

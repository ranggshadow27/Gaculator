import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/fonts.dart';

class DashboardTile extends StatelessWidget {
  const DashboardTile({
    super.key,
    required this.title,
    required this.currency,
    required this.onTap,
    required this.isTappable,
  });

  final String title;
  final String currency;
  final bool isTappable;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: isTappable ? onTap : null,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
          width: MediaQuery.of(context).size.width * .38,
          decoration: BoxDecoration(
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
                  color: isTappable ? orangeColor : textColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

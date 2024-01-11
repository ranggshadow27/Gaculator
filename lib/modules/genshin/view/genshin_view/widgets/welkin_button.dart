import 'package:flutter/material.dart';
import 'package:gaculator/constants/fonts.dart';

// ignore: must_be_immutable
class WelkinButton extends StatefulWidget {
  const WelkinButton({
    super.key,
    required this.icon,
    required this.textColor,
    required this.iconColor,
    required this.boxColor,
    required this.onTap,
  });

  final IconData icon;
  final Color textColor;
  final Color boxColor;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  State<WelkinButton> createState() => _WelkinButtonState();
}

class _WelkinButtonState extends State<WelkinButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Material(
        color: widget.boxColor,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: widget.onTap,
          child: SizedBox(
            height: 46,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "Blessing of the Welkin Moon",
                    style: fontMedium.copyWith(
                      fontSize: 12.0,
                      color: widget.textColor,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 20,
                  child: Icon(
                    widget.icon,
                    color: widget.iconColor,
                    size: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

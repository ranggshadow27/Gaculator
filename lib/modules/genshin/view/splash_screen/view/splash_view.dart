import 'package:flutter/material.dart';
import 'package:gaculator/constants/colors.dart';
import 'package:gaculator/constants/fonts.dart';

import '../controller/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  Widget build(BuildContext context, SplashController controller) {
    controller.view = this;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 128,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('splash_logo.png'),
              ),
            ),
          ),
          Text.rich(
            TextSpan(
              text: "Ga",
              style: fontBold.copyWith(
                color: orangeColor,
                fontSize: 24.0,
              ),
              children: [
                TextSpan(
                  text: "culator",
                  style: fontBold.copyWith(
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<SplashView> createState() => SplashController();
}

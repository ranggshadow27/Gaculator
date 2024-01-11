import 'package:flutter/material.dart';
import 'package:gaculator/constants/fonts.dart';

import '../view/genshin_view/genshin_view.dart';

class GenshinController extends State<GenshinView> {
  static late GenshinController instance;
  late GenshinView view;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isActive = true;
  bool isSnackbarShowed = false;

  //Spiral Abbys
  int abbyssStars = 0;
  int abbyssClear = 0;
  int abbyssIncome = 0;
  int abbyssPerFloor = 60;

  void increaseAmout(String value) {
    switch (value) {
      case "abbyssStars":
        if (abbyssStars < 36) {
          setState(() {
            abbyssStars++;
            abbyssIncome = abbyssStars * abbyssClear * abbyssPerFloor;
          });
        }
        break;
      case "abbyssClear":
        if (abbyssClear < 5) {
          setState(() {
            abbyssClear++;
            abbyssIncome = abbyssStars * abbyssClear * abbyssPerFloor;
          });
        }
        break;
      default:
    }
  }

  void decreaseAmout(String value) {
    switch (value) {
      case "abbyssStars":
        if (abbyssStars > 0) {
          setState(() {
            abbyssStars--;
            abbyssIncome = abbyssStars * abbyssClear * abbyssPerFloor;
          });
        }
        break;
      case "abbyssClear":
        if (abbyssClear > 0) {
          setState(() {
            abbyssClear--;
            abbyssIncome = abbyssStars * abbyssClear * abbyssPerFloor;
          });
        }
        break;
      default:
    }
  }

  void welkinSwitch() {
    debugPrint(isActive.toString());
    setState(() {
      isActive = !isActive;
    });

    Future.delayed(const Duration(milliseconds: 600), () => showSnackbar());
  }

  void showSnackbar() {
    if (!isSnackbarShowed) {
      isSnackbarShowed = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              isActive ? "Welkin Active" : "Welkin Disabled",
              style: fontMedium,
            ),
          ),
          duration: const Duration(milliseconds: 1200),
        ),
      );

      Future.delayed(const Duration(milliseconds: 600), () => isSnackbarShowed = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context, this);
  }
}

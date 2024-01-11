import 'package:flutter/material.dart';

import '../view/splash_view.dart';

class SplashController extends State<SplashView> {
  static late SplashController instance;
  late SplashView view;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashTimer();
  }

  Future splashTimer() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacementNamed('genshin'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context, this);
  }
}

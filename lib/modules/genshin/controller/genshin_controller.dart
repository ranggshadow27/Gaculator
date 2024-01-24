import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaculator/constants/colors.dart';
import 'package:gaculator/constants/fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/genshin_view/genshin_view.dart';

class GenshinController extends State<GenshinView> {
  static late GenshinController instance;
  late GenshinView view;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  bool isWelkinActive = false;
  bool isSnackbarShowed = false;

  //Spiral Abbys
  int abbyssStars = 0;
  int abbyssClear = 0;
  int abbyssIncome = 0;
  int abbyssPerFloor = 50;

  int daysTotal = 0;
  int dailyCommision = 0;
  int savingOverall = 0;
  int overallPulls = 0;
  double pitiesOverall = 0;

  TextEditingController primogemsC = TextEditingController();
  TextEditingController fatesC = TextEditingController();
  TextEditingController pitiesC = TextEditingController();

  Map<String, dynamic> paimonShop = {'total': 0, 'income': 600, 'amount': 0};
  Map<String, dynamic> battlePass = {'total': 0, 'income': 1320, 'amount': 0};
  Map<String, dynamic> streamCodes = {'total': 0, 'income': 300, 'amount': 0};
  Map<String, dynamic> bugCompensation = {'total': 0, 'income': 300, 'amount': 0};
  Map<String, dynamic> mtCompensation = {'total': 0, 'income': 300, 'amount': 0};
  Map<String, dynamic> mainEvent = {'total': 0, 'income': 1200, 'amount': 0};
  Map<String, dynamic> normalEvents = {'total': 0, 'income': 420, 'amount': 0};
  Map<String, dynamic> currentResource = {'primogems': 0, 'fates': 0, 'pities': 0};

  List<DateTime?> dates = [];
  DateTime tes = DateTime.now();
  String testr = "sad";

  void increaseAmout(String value) {
    switch (value) {
      case "abbyssStars":
        if (abbyssStars < 12) {
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
      case "paimonShop":
        if (paimonShop['amount'] < 5) {
          setState(() {
            paimonShop['amount']++;
            paimonShop['total'] = paimonShop['amount'] * paimonShop['income'];
          });
        }
        break;
      case "battlePass":
        if (battlePass['amount'] < 5) {
          setState(() {
            battlePass['amount']++;
            battlePass['total'] = battlePass['amount'] * battlePass['income'];
          });
        }
        break;
      case "streamCodes":
        if (streamCodes['amount'] < 5) {
          setState(() {
            streamCodes['amount']++;
            streamCodes['total'] = streamCodes['amount'] * streamCodes['income'];
          });
        }
        break;
      case "bugCompensation":
        if (bugCompensation['amount'] < 5) {
          setState(() {
            bugCompensation['amount']++;
            bugCompensation['total'] = bugCompensation['amount'] * bugCompensation['income'];
          });
        }
        break;
      case "mtCompensation":
        if (mtCompensation['amount'] < 5) {
          setState(() {
            mtCompensation['amount']++;
            mtCompensation['total'] = mtCompensation['amount'] * mtCompensation['income'];
          });
        }
        break;
      case "mainEvent":
        if (mainEvent['amount'] < 5) {
          setState(() {
            mainEvent['amount']++;
            mainEvent['total'] = mainEvent['amount'] * mainEvent['income'];
          });
        }
        break;
      case "normalEvents":
        if (normalEvents['amount'] < 5) {
          setState(() {
            normalEvents['amount']++;
            normalEvents['total'] = normalEvents['amount'] * normalEvents['income'];
          });
        }
        break;
      default:
    }
    countOverallSaving();
    saveData();
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
      case "paimonShop":
        if (paimonShop['amount'] > 0) {
          setState(() {
            paimonShop['amount']--;
            paimonShop['total'] = paimonShop['amount'] * paimonShop['income'];
          });
        }
        break;
      case "battlePass":
        if (battlePass['amount'] > 0) {
          setState(() {
            battlePass['amount']--;
            battlePass['total'] = battlePass['amount'] * battlePass['income'];
          });
        }
        break;
      case "streamCodes":
        if (streamCodes['amount'] > 0) {
          setState(() {
            streamCodes['amount']--;
            streamCodes['total'] = streamCodes['amount'] * streamCodes['income'];
          });
        }
        break;
      case "bugCompensation":
        if (bugCompensation['amount'] > 0) {
          setState(() {
            bugCompensation['amount']--;
            bugCompensation['total'] = bugCompensation['amount'] * bugCompensation['income'];
          });
        }
        break;
      case "mtCompensation":
        if (mtCompensation['amount'] > 0) {
          setState(() {
            mtCompensation['amount']--;
            mtCompensation['total'] = mtCompensation['amount'] * mtCompensation['income'];
          });
        }
        break;
      case "mainEvent":
        if (mainEvent['amount'] > 0) {
          setState(() {
            mainEvent['amount']--;
            mainEvent['total'] = mainEvent['amount'] * mainEvent['income'];
          });
        }
        break;
      case "normalEvents":
        if (normalEvents['amount'] > 0) {
          setState(() {
            normalEvents['amount']--;
            normalEvents['total'] = normalEvents['amount'] * normalEvents['income'];
          });
        }
        break;
      default:
    }
    countOverallSaving();
    saveData();
  }

  void welkinSwitch() async {
    setState(() {
      isWelkinActive = !isWelkinActive;
      countDailyCommision();
      countOverallSaving();
    });

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('welkin', isWelkinActive);
    } catch (e) {
      debugPrint("Failed put bool data");
    } finally {
      debugPrint("Success put bool");
    }

    Future.delayed(const Duration(milliseconds: 600), () => showSnackbar());
  }

  void showSnackbar() {
    if (!isSnackbarShowed) {
      isSnackbarShowed = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              isWelkinActive ? "Welkin Active" : "Welkin Disabled",
              style: fontMedium,
            ),
          ),
          duration: const Duration(milliseconds: 1200),
        ),
      );

      Future.delayed(const Duration(milliseconds: 600), () => isSnackbarShowed = false);
    }
  }

  showCalendar() async {
    final val = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.range,
      ),
      dialogSize: const Size(325, 400),
      value: dates,
    );

    if (val != null && val.length == 2) {
      setState(() {
        dates = val;
        daysTotal = val[1]!.difference(val[0]!).inDays;

        countDailyCommision();
        countOverallSaving();
      });

      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('startDate', val[0]!.toIso8601String());
        prefs.setString('endDate', val[1]!.toIso8601String());
        prefs.setInt('daysTotal', daysTotal);
      } catch (e) {
        debugPrint("Failed put data");
      } finally {
        debugPrint("Success");
      }

      debugPrint(val[0]!.toIso8601String());
      debugPrint(val[1]!.toIso8601String());
      debugPrint(dailyCommision.toString());
      debugPrint(daysTotal.toString());
    }
  }

  countDailyCommision() {
    if (isWelkinActive) {
      dailyCommision = daysTotal * 150;
    } else {
      dailyCommision = daysTotal * 90;
    }
  }

  countOverallSaving() {
    setState(() {
      savingOverall = paimonShop['total'] +
          battlePass['total'] +
          streamCodes['total'] +
          mtCompensation['total'] +
          bugCompensation['total'] +
          mainEvent['total'] +
          normalEvents['total'] +
          dailyCommision +
          abbyssIncome +
          currentResource['primogems'];

      overallPulls = currentResource['fates'] + ((savingOverall / 160).floor());
      pitiesOverall = (currentResource['pities'] + overallPulls) / 75;
    });
  }

  showInputDialog({
    required TextEditingController controller,
    required String hintText,
    required VoidCallback callback,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        color: primaryColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              cursorColor: textColor,
              textAlign: TextAlign.center,
              style: fontRegular,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: fieldColor,
                filled: true,
                hintText: hintText,
                hintStyle: fontRegular.copyWith(color: textColor.withOpacity(.6)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: textColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: textColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: orangeColor, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: callback,
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                backgroundColor: orangeColor,
              ),
              child: Text(
                "Submit",
                style: fontMedium.copyWith(color: primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  inputCurrentValue(String value) {
    switch (value) {
      case "primogems":
        var p = int.tryParse(primogemsC.value.text);
        if (primogemsC.value.text.isNotEmpty && p != null) {
          setState(() {
            currentResource['primogems'] = p;
            primogemsC.clear();
          });
          Navigator.pop(context);
        } else {
          errorDialog(primogemsC.value.text);
        }
        break;
      case "fates":
        var f = int.tryParse(fatesC.value.text);
        if (fatesC.value.text.isNotEmpty && f != null) {
          setState(() {
            currentResource['fates'] = f;
            fatesC.clear();
          });
          Navigator.pop(context);
        } else {
          errorDialog(fatesC.value.text);
        }
        break;
      case "pities":
        var pi = int.tryParse(pitiesC.value.text);
        if (pitiesC.value.text.isNotEmpty && pi != null) {
          setState(() {
            currentResource['pities'] = pi;
            pitiesC.clear();
          });
          Navigator.pop(context);
        } else {
          errorDialog(pitiesC.value.text);
        }
        break;
      default:
    }
    countOverallSaving();
    saveData();
  }

  errorDialog(String value) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                FontAwesomeIcons.solidCircleXmark,
                color: redColor,
                size: 50,
              ),
              const SizedBox(height: 12),
              Text(
                value.runtimeType != String || value.isEmpty
                    ? "Please fill the related field!"
                    : "Please input number value",
                style: fontMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  initCount() {
    setState(() {
      abbyssIncome = abbyssStars * abbyssClear * abbyssPerFloor;
      paimonShop['total'] = paimonShop['amount'] * paimonShop['income'];
      battlePass['total'] = battlePass['amount'] * battlePass['income'];
      streamCodes['total'] = streamCodes['amount'] * streamCodes['income'];
      mtCompensation['total'] = mtCompensation['amount'] * mtCompensation['income'];
      bugCompensation['total'] = bugCompensation['amount'] * bugCompensation['income'];
      mainEvent['total'] = mainEvent['amount'] * mainEvent['income'];
      normalEvents['total'] = normalEvents['amount'] * normalEvents['income'];
      countDailyCommision();
    });
  }

  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      prefs.setInt('paimonShop', paimonShop['amount']);
      prefs.setInt('battlePass', battlePass['amount']);
      prefs.setInt('streamCodes', streamCodes['amount']);
      prefs.setInt('mtCompensation', mtCompensation['amount']);
      prefs.setInt('bugCompensation', bugCompensation['amount']);
      prefs.setInt('mainEvent', mainEvent['amount']);
      prefs.setInt('normalEvents', normalEvents['amount']);
      prefs.setInt('abbyssClear', abbyssClear);
      prefs.setInt('abbyssStars', abbyssStars);
      prefs.setInt('savingOverall', savingOverall);
      prefs.setInt('currentPrimogem', currentResource['primogems']);
      prefs.setInt('currentFates', currentResource['fates']);
      prefs.setInt('currentPities', currentResource['pities']);
    } catch (e) {
      debugPrint("Saved Data Error");
    } finally {
      debugPrint("Saved Data Success");
    }
  }

  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      setState(() {
        paimonShop['amount'] = prefs.getInt('paimonShop') ?? 0;
        battlePass['amount'] = prefs.getInt('battlePass') ?? 0;
        streamCodes['amount'] = prefs.getInt('streamCodes') ?? 0;
        mtCompensation['amount'] = prefs.getInt('mtCompensation') ?? 0;
        bugCompensation['amount'] = prefs.getInt('bugCompensation') ?? 0;
        mainEvent['amount'] = prefs.getInt('mainEvent') ?? 0;
        normalEvents['amount'] = prefs.getInt('normalEvents') ?? 0;
        abbyssClear = prefs.getInt('abbyssClear') ?? 0;
        abbyssStars = prefs.getInt('abbyssStars') ?? 0;
        savingOverall = prefs.getInt('savingOverall') ?? 0;
        currentResource['primogems'] = prefs.getInt('currentPrimogem') ?? 0;
        currentResource['fates'] = prefs.getInt('currentFates') ?? 0;
        currentResource['pities'] = prefs.getInt('currentPities') ?? 0;
        dailyCommision = prefs.getInt('dailyCommision') ?? 0;
        daysTotal = prefs.getInt('daysTotal') ?? 0;
        isWelkinActive = prefs.getBool('welkin') ?? false;

        dates = [
          DateTime.parse((prefs.getString('startDate') ?? "")),
          DateTime.parse((prefs.getString('endDate') ?? "")),
        ];

        initCount();
      });
    } catch (e) {
      debugPrint("Get Data Failed");
    } finally {
      debugPrint("Get Data Success");
      countOverallSaving();
      countDailyCommision();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context, this);
  }
}

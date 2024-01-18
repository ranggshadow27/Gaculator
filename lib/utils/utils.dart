import 'package:intl/intl.dart';

class Utils {
  String dateFormat(dynamic value) {
    if (value.runtimeType != DateTime) {
      return "No Start&End Date Selected";
    }
    return DateFormat("dd - MMM - yyyy").format(value);
  }

  NumberFormat numFormatter = NumberFormat.decimalPattern('id');
}

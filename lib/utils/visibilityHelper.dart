import 'package:flutter/material.dart';

class SearchHelper {
  static bool validateDates({
    required BuildContext context,
    required String from,
    required String to,
  }) {
    if (from.isEmpty || to.isEmpty) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text('من فضلك اختر التاريخ من وإلى قبل البحث'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
      return false;
    }
    return true;
  }
}

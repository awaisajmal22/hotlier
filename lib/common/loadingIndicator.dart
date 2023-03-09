import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'app_color.dart';

void showLoadingIndicator(
    {required BuildContext context, bool isDark = false}) {
  showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0, vertical:20 ),
        child: const Dialog(
          backgroundColor: AppColor.transparent,
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: SpinKitThreeBounce(
            color: AppColor.cyan,
          
          ),
        ),
      );
    },
  );
}
void hideOpenDialog({
  required BuildContext context,
}) {
  Navigator.of(context).pop();
}
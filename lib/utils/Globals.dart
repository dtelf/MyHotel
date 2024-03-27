import 'package:flutter/cupertino.dart';
import 'package:myhotel/models/GetHotelRoomsResp.dart';

class Globals {
  static List<Rooms> rooms = [];
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static showPage(page, {Function()? callback}) {
    Route route = CupertinoPageRoute<bool>(builder: (BuildContext context) => page); //IOS show Page transition animation
    Navigator.push(navigatorKey.currentContext!, route).then((flag) {
      if (callback != null) {
        callback();
      }
    });
  }

  static replacePage(page, {Function()? callback}) {
    Route route = CupertinoPageRoute<bool>(builder: (BuildContext context) => page); //IOS show Page transition animation
    Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      route,
      (Route<dynamic> route) => false,
    ).then((flag) {
      if (callback != null) {
        callback();
      }
    });
  }

  static pop({int? count = 1}) {
    for (int i = 0; i < count!; i++) {
      Navigator.pop(Globals.navigatorKey.currentContext!);
    }
  }
}

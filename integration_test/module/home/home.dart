import 'package:flutter_test/flutter_test.dart';

import '../../data/ui_component_keys.dart';

class Home{
  static bookFlight(WidgetTester tester) async{
   // await Future.delayed(Duration(seconds: 1));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(HomePageUIKeys.homePageBookButton));

  }
}
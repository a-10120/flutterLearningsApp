import 'package:flutter_test/flutter_test.dart';

import '../../data/integration_test_data.dart';
import '../../data/ui_component_keys.dart';

class FlightSearch{
  static searchFlight(WidgetTester tester) async{
   await tester.pumpAndSettle();
   await tester.enterText(find.byKey(FlightSearchPageUIKeys.from), IntegrationTestData.from);
   await tester.pumpAndSettle();
   await Future.delayed(Duration(seconds: 2));
    await tester.enterText(find.byKey(FlightSearchPageUIKeys.to), IntegrationTestData.to);
    await tester.pumpAndSettle();
     await Future.delayed(Duration(seconds: 2));
     await tester.tap(find.byKey(FlightSearchPageUIKeys.flightSearchPageSearchButton));
await tester.pumpAndSettle();
//expect
  
  }
}
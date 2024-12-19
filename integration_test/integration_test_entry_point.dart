import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:learnings_app/modules/booking/presentation/home_page.dart';

import 'test_cases/flight_booking_test_cases.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("end-to-end test", () {
testWidgets("end-to-end-functionality-test", (tester) async{
  runApp(MyApp());
  await FlightBookingTestCases.flightBooking(tester);
});
   });


}
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../module/home/home.dart';

class FlightBookingTestCases{
  static flightBooking(WidgetTester tester) async{
    await Home.bookFlight(tester);
  }
}
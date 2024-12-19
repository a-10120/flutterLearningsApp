import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnings_app/modules/booking/presentation/home_page.dart';
class HttpBadCertificateOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
void main(){
  group("widget testing ", () {
    testWidgets("testing home page", (tester) async
    {
      //2 lines are for firebase 
      // WidgetsFlutterBinding.ensureInitialized();
      //  HttpOverrides.global = HttpBadCertificateOverrides();
     
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();
    expect(find.text("Book your flight"), findsOneWidget);
    });
   });
}
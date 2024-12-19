import 'package:flutter_test/flutter_test.dart';
import 'package:learnings_app/modules/booking/presentation/home_page.dart';

void main(){
  group('testing favourite test methods',(){
    final favourites=Favourites();
   test("new item should be added", () {
     favourites.add(20);
     expect(favourites.favourites.contains(20), true);
   });
  });
}
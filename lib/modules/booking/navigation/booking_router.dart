import 'package:flutter/material.dart';
import 'package:learnings_app/modules/booking/presentation/flight_result/flight_result_page.dart';
import 'package:learnings_app/modules/booking/presentation/flight_search/flight_search.dart';
import 'package:learnings_app/modules/booking/presentation/flight_search/viewmodel/occupancy_model.dart';

class BookingRouter{
  static const flightResultpageRoute="/booking/flightResultPage";
   static const flightsearchpageRout="/booking/flightSearchPage";
  String basePath="/booking/";
  Route onGenerateRoute(BuildContext context,RouteSettings settings){
    late Widget page;
    switch (settings.name){
      case flightResultpageRoute:
     // assert(settings.arguments!=null || settings.arguments )
        page=FlightResultPage();
        break;
      case flightsearchpageRout:
         assert(settings.arguments!=null ||settings.arguments is OccupancyModel,'Must provide [OccupancyModel] as  [RouteSettings] arguments');
         // if arguments are many
        //final List<dynamic> args = settings.arguments! as List<dynamic>;

         page=FlightSearchPage(occupancyModel: settings.arguments as OccupancyModel);
         // if arguments are many
         // page=FlightSearchPage(occupancyModel: args[0]);
         break;
      default:
         page = Scaffold(
          appBar: AppBar(
            title: const Text('Unknown'),
          ),
        );
        break;
    }
    return MaterialPageRoute(builder: (context){
      return page;
    },settings: settings);



    }


  }

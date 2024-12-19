import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnings_app/data/providers/flight_result_provider.dart';
import 'package:learnings_app/modules/booking/presentation/flight_result/viewmodel/flight_response_model.dart';

part "flight_result.event.dart";
part "flight_result_state.dart";

class FlightResultPageBloc extends Bloc<FlightResultPageEvent,FlightResultPageState>{
   FlightResultProvider? _flightResultProvider;
   FlightResultResponseModel? flightSearchResponseModel;
  FlightResultPageBloc():_flightResultProvider=FlightResultProvider(),super(FlightResultPageInitialState()){

    
    on<FlightResultPageLoadingEvent>((event,emit)async {
       emit(FlightResultPageLoadingState());
    await _initiateFlightSearch(emit);
       
    });
    
  }
  Future<void> _initiateFlightSearch(Emitter<FlightResultPageState> emit)async{
     final response=await _flightResultProvider!.fetchFlights();
    //  response.data!.forEach((element) { 
    //  element.itenaries!.forEach((element) {

    //   });
    //  });
    //  response.data!.first.itenaries.forEach((element) {
       
    //  },)
   emit(FlightResultPageLoadedState(flightSearchResponseModel: response));

    }
}
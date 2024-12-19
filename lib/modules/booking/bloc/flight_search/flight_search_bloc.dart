import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnings_app/data/providers/flight_result_provider.dart';
import 'package:learnings_app/modules/booking/presentation/flight_search/viewmodel/occupancy_model.dart';

import 'package:learnings_app/modules/booking/presentation/flight_search/viewmodel/occupancy_model.dart';
part "flight_search_event.dart";
part "flight_search_state.dart";

class FlightSearchBloc extends Bloc<FlightSearchEvent,FlightSearchState>{

  FlightSearchBloc():super(FlightSearchInitialState()){
    on<FlightSearchLoadingEvent>((event,emit){
      emit(FlightSearchLoadedState(occupancyModel: OccupancyModel()));
    });
    on<OccupancyUpdateEvent>((event,emit){
      emit(FlightSearchLoadedState(occupancyModel: event.occupancyModel));
    });

    on<NavigateToFlightResultPageEvent>((event,emit) async {
    emit(NavigateToFlightResultPageState());
    });
  }
}

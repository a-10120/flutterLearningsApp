import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnings_app/modules/booking/presentation/flight_result/viewmodel/flight_response_model.dart';
part "flight_detail_event.dart";
part 'flight_detail_state.dart';
class FlightDetailBloc extends Bloc<FlightDetailEvent,FlightDetailState>{
  FlightDetailBloc():super(FlightDetailInitialState()){
    on<FlightDetailLoadingEvent>((event, emit) {
      emit(FlightDetailLoadingState());

      emit(FlightDetailLoadedState(data:event.data,index: event.index));
    },);
  }
}
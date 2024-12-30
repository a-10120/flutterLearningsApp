part of "flight_detail_bloc.dart";

abstract class FlightDetailState{

}
class FlightDetailLoadingState extends FlightDetailState{
  FlightDetailLoadingState();
}
class FlightDetailLoadedState extends FlightDetailState{
 final Data data;
 final int index;
  FlightDetailLoadedState({required this.data,required this.index});
}
class FlightDetailInitialState extends FlightDetailState{
  FlightDetailInitialState();
}
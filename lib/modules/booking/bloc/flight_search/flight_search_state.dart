part of "flight_search_bloc.dart";
abstract class FlightSearchState{

}
class FlightSearchInitialState extends FlightSearchState{

}
class FlightSearchLoadedState extends FlightSearchState{
 final OccupancyModel occupancyModel;
 FlightSearchLoadedState({required this.occupancyModel});
}
class NavigateToFlightResultPageState extends FlightSearchState{

}
// class OccupancyUpdate extends FlightSearchEvent{
//   final OccupancyModel occupancyModel;
//   OccupancyUpdateEvent({required this.occupancyModel});
// }
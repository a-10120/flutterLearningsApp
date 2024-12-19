part of "flight_search_bloc.dart";
abstract class FlightSearchEvent{

}
class FlightSearchLoadingEvent extends FlightSearchEvent{
final OccupancyModel occupancyModel;
  FlightSearchLoadingEvent({required this.occupancyModel});
}
class OccupancyUpdateEvent extends FlightSearchEvent{
  final OccupancyModel occupancyModel;
  OccupancyUpdateEvent({required this.occupancyModel});
}
class NavigateToFlightResultPageEvent extends FlightSearchEvent{
  
  NavigateToFlightResultPageEvent();
}
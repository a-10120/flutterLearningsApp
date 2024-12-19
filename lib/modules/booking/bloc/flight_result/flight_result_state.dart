part of "flight_result_bloc.dart";



abstract class  FlightResultPageState{

}
class FlightResultPageLoadingState extends FlightResultPageState{

}
class FlightResultPageInitialState extends FlightResultPageState{

}
class FlightResultPageLoadedState extends FlightResultPageState{
final FlightResultResponseModel flightSearchResponseModel;
FlightResultPageLoadedState({required this.flightSearchResponseModel});
}
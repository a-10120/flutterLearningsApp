part of "flight_detail_bloc.dart";

abstract class FlightDetailEvent{

}
class FlightDetailLoadingEvent extends FlightDetailEvent{
  final Data data;
  final int index;
  FlightDetailLoadingEvent({required this.data,required this.index});
}
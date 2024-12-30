import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnings_app/modules/booking/bloc/flight_detail/flight_detail_bloc.dart';
import 'package:learnings_app/modules/booking/presentation/flight_result/viewmodel/flight_response_model.dart';
class FlightDetailPage extends StatefulWidget{
  State<FlightDetailPage> createState() => FlightDetailPageState();
 final Data data;
 final int index;
  FlightDetailPage({required this.data,required this.index,Key? key}):super(key: key); 
}


class FlightDetailPageState extends State<FlightDetailPage>{
  //final FlightResultResponseModel model;
 // FlightDetailPageState({Key? key}):super(key: key);
 late FlightDetailBloc _flightDetailBloc;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _flightDetailBloc=FlightDetailBloc();
    _flightDetailBloc.add(FlightDetailLoadingEvent(data: widget.data,index: widget.index));
  }
@override

Widget _rebuildUI(BuildContext context,FlightDetailState state){
  if(state is FlightDetailLoadingState){
    return Scaffold(appBar: AppBar(title: Text('Flight Detail Page'),
    ),

    body: Center(child: CircularProgressIndicator()));
  }
  else if(state is FlightDetailLoadedState){
    return Scaffold(appBar: AppBar(title: Text("Flight Detail Page"),
    
    ),
    body: Column(children: [
      
      Hero(
        tag: 'location-img-airport ${widget.index}',
        child: Image.asset("assets/images/airport ${widget.index}.png")),
      SizedBox(height: 10,),
      Text(state.data.itenaries!.first.duration!),
    ],),);
  }
  return Container();
}
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider.value(
      value: _flightDetailBloc,
      child: BlocConsumer<FlightDetailBloc,FlightDetailState>(
      
        builder: _rebuildUI, 
        listener: (context,state){
      
        },
        buildWhen: (previous, current) => 
        current is FlightDetailLoadedState ||
        current is FlightDetailLoadingState ,
        listenWhen: (previous, current) => 
        current is FlightDetailLoadingState,
        ),
    );
    
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnings_app/modules/booking/bloc/flight_result/flight_result_bloc.dart';
import 'package:learnings_app/modules/booking/presentation/flight_detail/flight_detail_page.dart';
import 'package:learnings_app/modules/booking/presentation/flight_result/viewmodel/flight_response_model.dart';

class FlightResultPage extends StatefulWidget{
  const FlightResultPage({super.key});

State<FlightResultPage> createState()=>FlightResultPageUiState();
}

class FlightResultPageUiState extends State<FlightResultPage>{
  late FlightResultPageBloc _flightResultPageBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _flightResultPageBloc=FlightResultPageBloc();
    _flightResultPageBloc.add(FlightResultPageLoadingEvent());
  }
var _color=Colors.red;
double isVisible=1;
  Widget _rebuildUI(BuildContext context,FlightResultPageState state){
    if(state is FlightResultPageLoadingState){
      return Scaffold(
        appBar:AppBar(
          title: Text("Flight Results"),
          
          ),
        body: Center(child: CircularProgressIndicator()));
    }
    else if(state is FlightResultPageLoadedState){
      return Scaffold(
        appBar: AppBar(
          title: Text("Flight Results"),
          
          ),body:AnimatedContainer(
            duration: Duration(seconds: 10),
            child: ListView.builder(
              itemCount: state.flightSearchResponseModel.data!.length,
              itemBuilder: (BuildContext context,int index){
                return _flightUi(context, state.flightSearchResponseModel, index);
                  //  state.flightSearchResponseModel.data![index].itenaries!.forEach((element) {
                  //     _flightUi(context, state.flightSearchResponseModel, index);
                  // },)  ;     
            
            }),
          )
          
          // Container(child: Text(state.flightSearchResponseModel.data!.first.id!),
          // )
           ,);
    }
    
    return Container();
  }
  _flightUi(BuildContext context,FlightResultResponseModel flightSearchResponseModel,int index){
    return Container(
  height: 100,
  child:  InkWell(
    onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FlightDetailPage(data:flightSearchResponseModel.data![index] ,index: index+1,)));
              },
    child: Card(child: 
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Hero(
       tag: 'location-img-airport ${index+1}',
      child: Image.asset("assets/images/airport ${index+1}.png",width: 80,height: 80,)),
    //Icon(Icons.flight),
    SizedBox(width: 10,),
    Text(flightSearchResponseModel.data![index].itenaries!.first.segments!.first.aircraft!.code!),
    SizedBox(width: 10,),
    Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    
    Text(flightSearchResponseModel.data![index].itenaries!.first.segments!.first.arrival!.at!.split("T0").last),
    Text(flightSearchResponseModel.data![index].itenaries!.first.segments!.first.arrival!.iataCode!),
    
    
    ],),
    SizedBox(width: 10,),
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(flightSearchResponseModel.data![index].itenaries!.first.duration!),
    
    //Divider(color: Colors.green,thickness: 5,),
    Text("Non Stop")
    
    ],),
    SizedBox(width: 10,),
    
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    
    Text(flightSearchResponseModel.data![index].itenaries!.first.segments!.first.departure!.at!.split("T").last),
    Text(flightSearchResponseModel.data![index].itenaries!.first.segments!.first.departure!.iataCode!),
    
    
    ],),
    SizedBox(width: 5,),
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(flightSearchResponseModel.data![index].price!.grandTotal!),
      Text("per adult")
    ],
    
    ),
    // IconButton(icon:Icon(Icons.heart_broken,color: _color,),onPressed: (){
    //   setState(() {
    //     _color=Colors.green;
    //     //isVisible=0;
    //   });
    
    
    // },),
    //if(isVisible)
    //Text("h")
    //AnimatedOpacity(opacity: isVisible, duration: Duration(seconds: 4),child: Text("g"),)
    
    
    
    ],),),
  ),);
  }

  void _listenToStateChanges(BuildContext context,FlightResultPageState state){
    
  }
 @override
  Widget build(BuildContext context){
return BlocProvider.value(
  value:_flightResultPageBloc ,
  child: BlocConsumer<FlightResultPageBloc,FlightResultPageState>(
    builder:_rebuildUI , 
    buildWhen: (previous,current)=>
    current is FlightResultPageLoadedState||
    current is FlightResultPageLoadingState,
    listenWhen: (previous, current) => 
    current is FlightResultPageLoadingState,
    listener: _listenToStateChanges),
);
  }
}
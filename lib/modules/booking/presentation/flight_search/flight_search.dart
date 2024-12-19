import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnings_app/modules/booking/bloc/flight_search/flight_search_bloc.dart';
import 'package:learnings_app/modules/booking/bloc/home/home_bloc.dart';
import 'package:learnings_app/modules/booking/navigation/booking_router.dart';
import 'package:learnings_app/modules/booking/presentation/flight_result/flight_result_page.dart';
import 'package:learnings_app/modules/booking/presentation/flight_search/viewmodel/occupancy_model.dart';

class FlightSearchPage extends StatefulWidget{
   const FlightSearchPage({super.key,required this.occupancyModel});
  final OccupancyModel occupancyModel;
  State<FlightSearchPage> createState()=>FlightSearchPageState();
}
class FlightSearchPageState extends State<FlightSearchPage>{
  late FlightSearchBloc _flightSearchBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _flightSearchBloc=FlightSearchBloc();
    _flightSearchBloc.add(FlightSearchLoadingEvent(occupancyModel: widget.occupancyModel));
  //

  }
  Widget _rebuildUi(BuildContext context,FlightSearchState state){
      if(state is FlightSearchLoadedState ){
      return  Scaffold(appBar: AppBar(title:Text("Flight")),
    body: Column(children: [
     TextFormField(
      key: Key("fromKey"),
      decoration: InputDecoration(icon: Icon(Icons.flight_takeoff),labelText: "From"),),
     TextFormField(
      key: Key("toKey"),
      decoration: InputDecoration(icon: Icon(Icons.flight_land),labelText: "To"),),
     Text("${state.occupancyModel.adults}"),
  // ignore: avoid_print
  
Padding(
  padding: const EdgeInsets.only(left:30.0),

  child: TextFormField(
    initialValue: DateTime.now().toString(),
    readOnly: true,
    decoration: InputDecoration(suffixIcon: 
   IconButton(icon: Icon(Icons.calendar_month,),onPressed: () {
     
   },)
    ,labelText: "Departure"),),
),
 TextFormField(
    initialValue: "1 Traveller",
    readOnly: true,
    decoration: InputDecoration(labelText: "Travellers and Class",suffixIcon: 
    IconButton(icon: Icon(Icons.arrow_drop_down_sharp),onPressed: () {
      bottomSheet(state);
      
    },),),),
ElevatedButton(
      key: const Key("flightSearchButtonKey"),
      onPressed: (){
        _flightSearchBloc.add(NavigateToFlightResultPageEvent());
      }, child: Text("Search"))

    ],),

    );
      }
      return Container();
    }

    Widget _addAndSubractUi(BuildContext context,bool isAdult,FlightSearchLoadedState state){
      return Row(children: [
        Container(child: CircleAvatar(backgroundColor: Colors.blue,child: 
        IconButton(icon: Icon(Icons.add),onPressed: () {
         add(isAdult,state); 
        },),))

      ],);
    }
    void add(bool isAdult,FlightSearchLoadedState state){
       final occupancy=isAdult?state.occupancyModel.addAdults():state.occupancyModel.addChildren();

     _flightSearchBloc.add(OccupancyUpdateEvent(occupancyModel: occupancy!));
    }
    void subtract(bool isAdult){
       final occupancy=isAdult?widget.occupancyModel.subtractAdults():widget.occupancyModel.subtractChildren();
   BlocProvider.of<FlightSearchBloc>(context).add(OccupancyUpdateEvent(occupancyModel: occupancy!));
    }
    void bottomSheet(FlightSearchLoadedState flightSearchLoadedState){
       showModalBottomSheet(
        
   // backgroundColor: Colors.transparent,
   // barrierColor: Colors.black38,
    context: context, builder: (BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height*0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      //SizedBox(height: 30,),
      Row(
        children: [
          Text("Adults"),
_addAndSubractUi(context,true,flightSearchLoadedState),
        ],
      ),
      Text("${flightSearchLoadedState.occupancyModel.adults}"),
      Divider(),
      Text("Children"),
      Text("${flightSearchLoadedState.occupancyModel.children}"),
      Divider(),
      

      ],),
    );
  });
    }
@override
  Widget build(BuildContext context){
return BlocProvider.value(
  value: _flightSearchBloc,
  child: BlocConsumer<FlightSearchBloc,FlightSearchState>(
    builder:_rebuildUi ,
    buildWhen: (previous, current) => 
    current is FlightSearchLoadedState,
    listenWhen: (previous, current) => current is NavigateToFlightResultPageState,
    listener:(context, state) {
      if(state is NavigateToFlightResultPageState){
        Navigator.of(context).pushNamed(BookingRouter.flightResultpageRoute);
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>FlightResultPage()));
      }
    }, 
  ),);
    
    
  }
}
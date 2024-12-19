import 'dart:async';
import 'dart:io';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnings_app/modules/booking/bloc/home/home_bloc.dart';
import 'package:learnings_app/modules/booking/navigation/booking_router.dart';
import 'package:learnings_app/modules/booking/presentation/flight_search/flight_search.dart';
import 'package:learnings_app/modules/booking/presentation/flight_search/viewmodel/occupancy_model.dart';

void main() async{

//WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp(
//         options: FirebaseOptions(
//             apiKey: "your api key Found in GoogleService-info.plist",
//             appId: "Your app id found in Firebase",
//             messagingSenderId: "Your Sender id found in Firebase",
//             projectId: "Your Project id found in Firebase"));
            
//   FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
   HttpOverrides.global = MyHttpOverrides();
  runApp( MyApp());
}
// Future<void> _backgroundHandler(RemoteMessage message) async {
//   // Handle background message
// }
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}):super(key: key);
  @override
  _MyAppState createState()=> _MyAppState();


}
class _MyAppState extends State<MyApp>{

@override
  void initState() {
    // TODO: implement initState
    super.initState();
   // pushNotificationSetup();
    

  }
  // Future<void> pushNotificationSetup() async{
  //    await FirebaseMessaging.instance.requestPermission(
  //     sound: true,
  //     alert: true,
  //     badge: true,
  //     provisional: false);
      
  //       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     print('Message data: ${message.data}');
  //     if (message.notification != null) {
  //       print('Message also contained a notification: ${message.notification}');
  //     }
  //   });
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     print('Message clicked! ${message.messageId}');
  //   });
  // }
 @override
  Widget build(BuildContext context) {
    BookingRouter bookingRouter=BookingRouter();
    return MaterialApp(debugShowCheckedModeBanner: false,
    
    onGenerateRoute: ((settings) =>bookingRouter.onGenerateRoute(context, settings) ),
  theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple)),
    home: const HomePage(),

    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
late HomeBloc _homebloc;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homebloc=HomeBloc();
    _homebloc.add(HomePageLoadingEvent());
  }
  Widget _rebuildUi(BuildContext context,HomeState state){
    
    if(state is HomePageLoadingState){

    }
    if(state is HomePageLoadedState){
 return Scaffold(
    appBar: AppBar(title: Text("Welcome"),backgroundColor: Colors.purple,),
    body:Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       // mainAxisAlignment: MainAxisAlignment.cente,
        children: [
      
      Stack(
        children: [
      Container(
       alignment: Alignment.center,
        child: Image.network(
           height: MediaQuery.of(context).size.height*0.32,
        //width: MediaQuery.of(context).size.width*1,
       
           width: double.infinity,
            fit: BoxFit.cover,
          "https://images.pexels.com/photos/62623/wing-plane-flying-airplane-62623.jpeg")
      
        ),
          //alignment: Alignment.center,
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Flight ways",style: Theme.of(context).textTheme.bodyLarge,),
              SizedBox(height: 5,),
              Text("Easiest way to book your flights",style: TextStyle(color: Colors.white),)
            ],
          ),
       
       
        ],
      ),
      SizedBox(height: 20,),
      Center(child: ElevatedButton(
        key: const Key("bookFlightButtonKey"),
        child: RichText(text: TextSpan(text: "Book ",style: TextStyle(color: Colors.indigo),children:[
          TextSpan(text: "your ",style: TextStyle(color: Colors.red)),
          TextSpan(text: "flight  ",style: TextStyle(color: Colors.indigo))
        ] ),),
        //Text("Book your flight",),
      onPressed: () {
      BlocProvider.of<HomeBloc>(context).add(NavigateToSearchPageEvent());
      },),)
      ],),
    ));
    }
    return Container();
  }
 void _listenToStateChanges(BuildContext context,HomeState state) async{
  if(state is NavigateToSearchPageState ){
    Navigator.of(context).pushNamed(BookingRouter.flightsearchpageRout,arguments: OccupancyModel());
     //Navigator.push(context, MaterialPageRoute(builder: (context)=>FlightSearchPage(occupancyModel: OccupancyModel(),)));
  }

  }
  @override
 Widget build(BuildContext context){
  return BlocProvider.value(
    value:_homebloc ,
    child: BlocConsumer<HomeBloc,HomeState>(
      listenWhen: (oldState,newState)=>
      newState is NavigateToSearchPageState,
      buildWhen: (oldState,newState)=>
      newState is HomePageLoadedState ||
      newState is HomePageLoadingState,
      builder: _rebuildUi, listener:_listenToStateChanges ),
  );
  
  
 
  //Text("hi");
 }

}

class Favourites{
  List<int> favourites=[];

  void add(int itemNo){
    favourites.add(itemNo);

  }
 void subtract(int itemNo){
    favourites.remove(itemNo);
    
  }
}
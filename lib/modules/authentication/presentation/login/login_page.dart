import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnings_app/data/providers/user_details_provider.dart';
import 'package:learnings_app/modules/booking/navigation/booking_router.dart';
import 'package:learnings_app/modules/authentication/presentation/login/viewModel/user_model.dart';
import 'package:learnings_app/modules/booking/presentation/home_page.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../bloc/login_page_bloc.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
//sqfliteFfiInit();


 //databaseFactory = databaseFactoryFfi;


// final database=openDatabase(join(await getDatabasesPath(),'user_details.db'),
// onCreate: (db, version) {
//   return db.execute('create table user(email text primary key , password text)');
// },
// version: 1
// );
//final db=openDatabase(join(await getDatabasesPath(),"fgrr"));
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
  MyApp();
  State<MyApp> createState()=> MyAppState();

}
class MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context){
        BookingRouter bookingRouter=BookingRouter();
    return   MaterialApp(debugShowCheckedModeBanner: false,
    
    onGenerateRoute: ((settings) =>bookingRouter.onGenerateRoute(context, settings) ),
  theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple)),
    home: LoginPage(),

    );


  }
}
class LoginPage extends StatefulWidget{

  State<LoginPage> createState()=> _LoginPageState();

}
class _LoginPageState extends State<LoginPage>{
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
   TextEditingController signUpEmail=TextEditingController();
  TextEditingController signUpPassword=TextEditingController();
  TextEditingController signUpName=TextEditingController();
  UserDetailsProvider? userDetailsProvider;
  late LoginPageBloc _loginPageBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginPageBloc=LoginPageBloc();
    userDetailsProvider=UserDetailsProvider();
    userDetailsProvider!.initializeDataBase();
    _loginPageBloc.add(LoginPageLoadingEvent());
  }
  Widget _buildUi(BuildContext context,LoginPageState state){
    if(state is LoginPageLoadedState){
   return   Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
     //SizedBox(height: 100,),
      TextFormField(
        controller: email,

        decoration: InputDecoration(labelText: "username"),),
      SizedBox(height: 15,),
      TextFormField(
        controller: password,
        decoration: InputDecoration(labelText: "password")),
      SizedBox(height: 20,),
      ElevatedButton(onPressed:(){
        BlocProvider.of<LoginPageBloc>(context).add(UserChangedEvent.customer(email:email.text,password: password.text, ));
      //  var userDetails= userDetailsProvider!.getUser(email.text);
      // // print(userDetails);
      //   if(userDetails!=null && userDetails.toString().contains(email.text)){
      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      //   }
      } , child: Text("Login")),
      SizedBox(height: 20,),
      ElevatedButton(onPressed:(){
showModalBottomSheet(context: context, builder: (BuildContext context){
  return SizedBox(
    height: MediaQuery.of(context).size.height*1,
    child: Column(
    //mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextFormField(
       controller: signUpName,

        decoration: InputDecoration(labelText: "name"),),
      SizedBox(height: 15,),
       TextFormField(
        controller: signUpEmail,

        decoration: InputDecoration(labelText: "username"),),
      TextFormField(
        controller:signUpPassword,
        decoration: InputDecoration(labelText: "password")),
      SizedBox(height: 20,),
      ElevatedButton(onPressed:(){
       userDetailsProvider!.insertUserDetails(UserDetails(email: signUpEmail.text, password: signUpPassword.text,name:signUpName.text));
      } , child: Text("Sign Up")),
    
      SizedBox(height: 15,),
      
  ],),);

});

      } , child: Text("Sign up")),
    ],),);
    }
    else if(state is LoginPageLoadingState){
      return Center(child:CircularProgressIndicator());
    }
    return Container();
  }
  void _listenToStateChanges(BuildContext context,LoginPageState state){
    if(state is NavigateToHomePageState){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }
    else if(state is LoginErrorState){
      Navigator.pop(context);
      showDialog(context: context, builder: (context){
    return AlertDialog(content: Text("please enter valid credentials"),);
      });
       
    }
  }
  @override
  Widget build(BuildContext context){
    return BlocProvider.value(value:_loginPageBloc,
    child:BlocConsumer<LoginPageBloc,LoginPageState>(
    buildWhen: (previous, current) => 
    current is LoginPageLoadingState||
    current is LoginPageLoadedState,
    listenWhen: (previous, current) => 
    current is NavigateToHomePageState ||
    current is LoginErrorState,
    listener: _listenToStateChanges,
    builder: _buildUi, ) ,
     );
   
  }
}
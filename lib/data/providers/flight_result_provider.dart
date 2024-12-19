import 'package:learnings_app/modules/booking/presentation/flight_result/viewmodel/flight_response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class FlightResultProvider{
  Future<FlightResultResponseModel> fetchFlights() async{
    try{
final response=await http.get(Uri.parse('https://api.npoint.io/9425e37aa363c195e09e') );
    return FlightResultResponseModel.fromJson(json.decode(response.body));
    }catch(e){
rethrow;
    }
    
  }
}
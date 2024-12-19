class FlightResultResponseModel{
  List<Data>? data;
  FlightResultResponseModel({this.data});
  FlightResultResponseModel.fromJson(Map<String,dynamic> json){
    data=List<Data>.from(json["data"].map((x)=>Data.fromJson(x)));
  }

}

class Data{
  String? id;
 String? type;
 bool? oneway;
 String? source;
 int? numberOfBookableSeats;
Price? price;
List<TravellerPricings>? travellerPricings;
List<Itenaries>? itenaries;
Data({this.id,this.itenaries,this.numberOfBookableSeats,this.oneway,this.price,this.source,this.travellerPricings,this.type});
Data.fromJson(Map<String,dynamic> json){
  id=json["id"];
  type=json["type"];
  //price=;
  oneway = json['oneWay'];
  source = json['source'];
  numberOfBookableSeats = json['numberOfBookableSeats'];
  price=Price.fromJson(json["price"]);
travellerPricings=List<TravellerPricings>.from(json["travelerPricings"].map((x)=> TravellerPricings.fromJson(x)));
itenaries=List<Itenaries>.from(json["itineraries"].map((x)=>Itenaries.fromJson(x)));


}

}
class Itenaries{
  String? duration;
  List<Segments>? segments;
Itenaries({this.duration,this.segments});
Itenaries.fromJson(Map<String,dynamic> json){
  duration=json["duration"];
  segments=List<Segments>.from(json["segments"].map((x)=>Segments.fromJson(x)));
}
}
class Segments{
  String? id;
  String? number;
  String? carrierCode;
  int? noofStops;
  Arrival? arrival;
  Aircraft? aircraft;
  Arrival? departure;
Segments({this.aircraft,this.arrival,this.carrierCode,this.departure,this.id,this.noofStops,this.number});
Segments.fromJson(Map<String,dynamic> json){
 id = json['id'];
		number = json['number'];
    carrierCode = json['carrierCode'];
		noofStops = json['numberOfStops'];
    aircraft=Aircraft.fromJson(json["aircraft"]);
    arrival=Arrival.fromJson(json["arrival"]);
    departure=Arrival.fromJson(json["departure"]);
}
}
class Arrival{
  String? at;
  String? iataCode;
Arrival({this.at,this.iataCode});
Arrival.fromJson(Map<String,dynamic> json){
  at=json["at"];
  iataCode=json["iataCode"];

}
Map<String,dynamic> toJson()=>{
"at":at,
"iataCode":iataCode,
};
}
class Aircraft{
  String? code;
  Aircraft({this.code});
  Aircraft.fromJson(Map<String,dynamic> json){
    code=json["code"];
  }
  Map<String,dynamic> toJson()=>{
    "code":code
  };

}
class Price{
  String? base;
  String? total;
  String? currency;
  String? grandTotal;
  List<Fees>? fee;

Price({this.base,this.currency,this.fee,this.grandTotal,this.total});
Price.fromJson(Map<String,dynamic> json){
  base=json["base"];
  total=json["total"];
  currency=json["currency"];
  grandTotal=json["grandTotal"];
  fee=json["fees"]!=null?List<Fees>.from(json["fees"].map((x)=>Fees.fromJson(x))):null;
Map<String,dynamic> toJson()=>{
"base":base,
"total":total,
"currency":currency,
"grandTotal":grandTotal,
"fees":List<Fees>.from(fee!.map((x)=>x.toJson()))
};
}
Map<String,dynamic> toJson()=>{
  "base":base,
  "total":total,
  "currency":currency,
  "grandTotal":grandTotal,
  "fee":List<Fees>.from(fee!.map((x)=>x))
};

}
class Fees{
String? type;
String? amount;
Fees({this.type,this.amount});
Fees.fromJson(Map<String,dynamic> json){
  type=json["type"];
  amount=json["amount"];
}
Map<String,dynamic> toJson()=>{
  "type":type,
  "amount":amount,
};
}
class TravellerPricings{
Price? price;
String? travellerId;
String? travellerType;
List<FareDetailsBySegment>? fareDetailsBySegment;
TravellerPricings({this.fareDetailsBySegment,this.price,this.travellerId,this.travellerType});
TravellerPricings.fromJson(Map<String,dynamic> json){
  price=Price.fromJson(json["price"]);
  travellerId=json["travellerId"];
  travellerType=json["travellerType"];
  fareDetailsBySegment=List<FareDetailsBySegment>.from(json["fareDetailsBySegment"].map((x)=>FareDetailsBySegment.fromJson(x)));
}

}
class FareDetailsBySegment{
  String? cabin;
  String? travellerClass;
  String? fareBasis;
FareDetailsBySegment({this.cabin,this.fareBasis,this.travellerClass});
FareDetailsBySegment.fromJson(Map<String,dynamic> json){
  cabin=json["cabin"];
  travellerClass=json["class"];
  fareBasis=json["fareBasis"];
}

}
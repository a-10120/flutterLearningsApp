class OccupancyModel {
  final int adults;
 final int children;
  OccupancyModel({this.adults=1,this.children=0}) ;
 OccupancyModel copyWith({int? adults,int? children})=>OccupancyModel(adults: adults?? this.adults, children: children ?? this.children);

OccupancyModel? addAdults(){
  return copyWith(adults: adults+1);
 }
 OccupancyModel? subtractAdults(){
  return copyWith(adults: adults-1);
 }
 OccupancyModel? addChildren(){
  return copyWith(children:children+1);
 }
 OccupancyModel? subtractChildren(){
  return copyWith(children: children-1);
 }
}
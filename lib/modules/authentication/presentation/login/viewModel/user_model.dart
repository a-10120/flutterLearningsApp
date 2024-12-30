class UserDetails{
   String email;
  String password;String name;
  UserDetails({required this.email,required this.password,required this.name});

  factory UserDetails.fromJson(Map<String,dynamic> json) =>
    UserDetails(email: json['email'],
    password: json['password'],
    name: json['name']??'');
  
  Map<String,dynamic> toJson()=>{
  "email":email,
  "password":password,
  "name":name,
  };
}
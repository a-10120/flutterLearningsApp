part of "login_page_bloc.dart";
abstract class LoginPageEvent{

}

class LoginPageInitialEvent extends LoginPageEvent{
  LoginPageInitialEvent();
}
class LoginPageLoadingEvent extends LoginPageEvent{

}
class LoginPageLoadedEvent extends LoginPageEvent{
  
}
class NavigateToHomePageEvent extends LoginPageEvent{
  
}
class UserChangedEvent extends LoginPageEvent{
  final String? email;
  final String? password;
  UserChangedEvent._({this.email,this.password}); // we can also create without ._
  UserChangedEvent.guest(): this._();
  UserChangedEvent.customer({String? email,String? password}):this._(email: email,password: password);

  
}
class SignUpEvent extends LoginPageEvent{
  final UserDetails signUpDetails;
  SignUpEvent({required this.signUpDetails});
}
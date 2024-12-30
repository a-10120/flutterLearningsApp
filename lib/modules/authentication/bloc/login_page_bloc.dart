import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnings_app/data/providers/user_details_provider.dart';
import 'package:learnings_app/modules/authentication/presentation/login/viewModel/user_model.dart';
part "login_page_event.dart";
part "login_page_state.dart";
class LoginPageBloc extends Bloc<LoginPageEvent,LoginPageState> {
  final UserDetailsProvider _userDetailsProvider;
  LoginPageBloc():_userDetailsProvider=UserDetailsProvider(),super(LoginPageInitialState()){
    on<LoginPageLoadingEvent>((event, emit) {
      emit(LoginPageLoadedState());

    },);
    on<UserChangedEvent>((event, emit) async{
     // emit(LoginPageLoadingState());
      if(event.email!=''){
         var userDetails= await _userDetailsProvider.getUser(event.email!);
 if(userDetails!=null && ((userDetails.toString().contains(event.email!)) &&(userDetails.toString().contains(event.password!)))){
  emit(NavigateToHomePageState());
         // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        }
        else{
          emit(LoginErrorState());
        }
      }
      else{
        emit(NavigateToHomePageState());
      }
    },);
    on<SignUpEvent>((event,emit){
      _userDetailsProvider.insertUserDetails(event.signUpDetails);
    });
  }
  
}
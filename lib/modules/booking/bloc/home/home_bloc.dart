
import 'package:flutter_bloc/flutter_bloc.dart';

part  "home_event.dart";
part  "home_state.dart";
class HomeBloc extends Bloc<HomeEvent,HomeState>{
   HomeBloc():super(HomeInitialState()){

     on<HomePageLoadingEvent>((event,emit) async{
   emit(HomePageLoadingState());
   emit(HomePageLoadedState());
   });
   on<NavigateToSearchPageEvent>((event,emit) async{
emit(NavigateToSearchPageState()
);
   });
   }


}
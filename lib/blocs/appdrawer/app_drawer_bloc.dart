import 'package:blaze_chat/blocs/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:blaze_chat/blocs/appdrawer/appdrawer.dart';
import 'package:blaze_chat/user_repository.dart';



class AppDrawerBloc extends Bloc<AppDrawerEvent, AppDrawerState>  {
  final UserRepository _userRepository;

  AppDrawerBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;


  @override
  AppDrawerState get initialState => InitialAppDrawerState();

  @override
  Stream<AppDrawerState> mapEventToState(AppDrawerEvent event) async* {
    if(event is InitialAppDrawer){
      yield InitialAppDrawerState();
    }
    if(event is LoadingAppDrawer){
      yield* _mapLoadingAppDrawerState();
    }
    if(event is LoadedAppDrawer){
      print('Done');
    }

  }

  Stream<AppDrawerState> _mapLoadingAppDrawerState() async* {
    try {
      final displayName = await _userRepository.getUser();
      if(displayName != null) {
        print('Loading DisplayName:' + displayName);
        yield LoadedAppDrawerState(displayName: displayName);
      }
    } catch(error,stacktrace){
      print(error.toString());
      print(stacktrace.toString());
      yield ErrorAppDrawerState();
    }
  }

  @override
  void onTransition(Transition<AppDrawerEvent, AppDrawerState> transition) {
    print(transition);
  }


}
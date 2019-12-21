import 'package:blaze_chat/blocs/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:blaze_chat/blocs/appdrawer/appdrawer.dart';
import 'package:blaze_chat/user_repository.dart';



class AppDrawerBloc extends Bloc {
  final UserRepository _userRepository;

  AppDrawerBloc({@required userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AppDrawerState get initialState => InitialAppDrawerState();

  @override
  Stream mapEventToState(event) {
    // TODO: implement mapEventToState

    return null ;
  }

  /*@override
  Stream<AppDrawerState> mapEventToState(AppDrawerEvent event) async* {
    if (event is AppStarted) {
        yield InitialAppDrawerState;
    }
  }*/



}
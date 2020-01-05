import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:blaze_chat/user_repository.dart';
import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository _userRepository;

  HomeBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  HomeState get initialState => Initialized();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) {
    // TODO: implement mapEventToState
    return null;
  }
}
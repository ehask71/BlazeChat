import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:blaze_chat/user_repository.dart';

import './authentication.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required userRepository})
      : assert(userRepository != null),_userRepository = userRepository;

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await _userRepository.hasToken();
      await Future.delayed(Duration(milliseconds: 2000));
      if (hasToken) {
        print('Has Token called in AppStarted');
        //_appDrawerBloc.add(LoadingAppDrawer());
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await _userRepository.persistToken(event.token);
      /*_appDrawerBloc.add(LoadingAppDrawer());*/
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await _userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }

}

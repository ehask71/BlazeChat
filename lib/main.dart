import 'package:blaze_chat/blocs/addchat/addchat.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blaze_chat/simple_bloc_delegate.dart';
import 'package:blaze_chat/blocs/authentication/authentication.dart';
import 'package:blaze_chat/blocs/splash/splash.dart';
import 'package:blaze_chat/blocs/login/login.dart';
import 'package:blaze_chat/blocs/home/home.dart';
import 'package:blaze_chat/common/common.dart';

import 'user_repository.dart';
import 'blocs/settings/settings.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ILMC Groups',
      debugShowCheckedModeBanner: true,
      routes: {
        '/addchat': (context) => AddChatPage(),
        '/settings': (context) => SettingsPage(),
      },
      theme: new ThemeData(
          primarySwatch: primaryBlack,
          primaryTextTheme: TextTheme(
              title: TextStyle(color: Colors.yellow[800]),
              body1: TextStyle(color: Colors.yellow[800]))),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return HomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: _userRepository);
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return SplashPage();
        },
      ),
    );
  }
}

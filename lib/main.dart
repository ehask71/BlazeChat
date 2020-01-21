import 'package:blaze_chat/blocs/addchat/addchat.dart';
import 'package:blaze_chat/blocs/appdrawer/appdrawer.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blaze_chat/simple_bloc_delegate.dart';
import 'package:blaze_chat/blocs/authentication/authentication.dart';
import 'package:blaze_chat/blocs/splash/splash.dart';
import 'package:blaze_chat/blocs/login/login.dart';
import 'package:blaze_chat/blocs/home/home.dart';
import 'package:blaze_chat/blocs/groups/groups.dart';
import 'package:blaze_chat/blocs/group/group.dart';
import 'package:blaze_chat/common/common.dart';

import 'user_repository.dart';
import 'blocs/settings/settings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted()),
      ),
      BlocProvider<AppDrawerBloc>(
          create: (context) => AppDrawerBloc(userRepository)
          //..add(InitialAppDrawer()),
          ),
      BlocProvider<GroupsBloc>(
        create: (context) => GroupsBloc(userRepository: userRepository),
      )
    ],
    child: App(userRepository: userRepository),
  ));
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
        GroupPage.routeName: (context) => GroupPage()
      },
      theme: new ThemeData(
          primarySwatch: primaryBlack,
          primaryTextTheme: TextTheme(
              title: TextStyle(color: Colors.yellow[800]),
              body1: TextStyle(color: Colors.yellow[800])),
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.yellow[800],
              textTheme: ButtonTextTheme.primary)),
      home: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
        //print('Listener:' + state.toString());
        if (state is Authenticated) {
          BlocProvider.of<AppDrawerBloc>(context).add(LoadingAppDrawer());
          BlocProvider.of<GroupsBloc>(context).add(LoadGroups());
        }
      }, child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return GroupsPage();
          }
          if (state is Unauthenticated) {
            return LoginPage(userRepository: _userRepository);
          }
          /*if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }*/
          return SplashPage();
        },
      )),
    );
  }
}

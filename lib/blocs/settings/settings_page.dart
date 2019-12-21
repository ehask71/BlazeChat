import 'package:blaze_chat/blocs/appdrawer/appdrawer.dart';
import 'package:blaze_chat/user_repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blaze_chat/blocs/authentication/authentication.dart';

class SettingsPage extends StatelessWidget {

  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawerPage(userRepository: userRepository),
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        margin: new EdgeInsets.all(20.0),
        child: Center(
            child: RaisedButton(
              child: Text('logout'),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              },
            )),
      ),
    );
  }
}

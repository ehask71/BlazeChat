import 'package:blaze_chat/blocs/appdrawer/app_drawer_bloc.dart';
import 'package:blaze_chat/blocs/appdrawer/app_drawer_state.dart';
import 'package:blaze_chat/blocs/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blaze_chat/user_repository.dart';

class AppDrawerPage extends StatelessWidget {
  final UserRepository userRepository;

  AppDrawerPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppDrawerBloc appDrawerBloc = BlocProvider.of<AppDrawerBloc>(context);
    return BlocBuilder<AppDrawerBloc, AppDrawerState>(
        bloc: BlocProvider.of<AppDrawerBloc>(context),
        builder: (BuildContext context, AppDrawerState state) {
          if (state is LoadingAppDrawerState) {
            return Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Center(child: CircularProgressIndicator()));
          }
          if (state is ErrorAppDrawerState) {
            return Text('Error!');
          }
          if (state is LoadedAppDrawerState) {
            //return Text('app');
            print('Loaded Drawer');
            print(state);
            print(state.displayName);
            print('End State');
            final String displayName = state.displayName;
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/Hellfire-Eight-4inch.png'))),
                      child: Stack(children: <Widget>[
                        Positioned(
                            bottom: 12.0,
                            left: 16.0,
                            child: Text(displayName,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500))),
                      ])),
                  _createDrawerItem(
                      icon: Icons.contacts,
                      text: 'Chats',
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/')),
                  _createDrawerItem(
                      icon: Icons.event,
                      text: 'Add Chat',
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/addchat')),
                  _createDrawerItem(icon: Icons.recent_actors, text: 'Archive'),
                  Divider(),
                  _createDrawerItem(icon: Icons.help_outline, text: 'Help'),
                  _createDrawerItem(
                      icon: Icons.build,
                      text: 'Settings',
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/settings')),
                  /* _createDrawerItem(
            icon: Icons.reply_all,
            text: 'Logout',
            onTap: () => BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut())
          ),*/
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(Icons.reply_all),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text('Logout'),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(LoggedOut());
                    },
                  ),
                  ListTile(
                    title: Text('0.0.1'),
                    onTap: () {},
                  ),
                ],
              ),
            );
          } else {
            return Container(
              child: Text('oops'),
            );
          }
        });
  }

  Widget _createHeader(String name) {
    String _name = name;
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/Hellfire-Eight-4inch.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text(_name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}

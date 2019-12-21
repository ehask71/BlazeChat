import 'package:blaze_chat/blocs/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blaze_chat/user_repository.dart';

class AppDrawer extends StatelessWidget {
  final String displayName;

  AppDrawer({Key key, @required this.displayName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    print(this.displayName);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader('Rant'),
          _createDrawerItem(
              icon: Icons.contacts,
              text: 'Chats',
              onTap: () => Navigator.pushReplacementNamed(context, '/')),
          _createDrawerItem(
              icon: Icons.event,
              text: 'Add Chat',
              onTap: () => Navigator.pushReplacementNamed(context, '/addchat')),
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
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          ),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
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

import 'package:blaze_chat/blocs/groups/groups.dart';
import 'package:blaze_chat/blocs/appdrawer/appdrawer.dart';
import 'package:blaze_chat/user_repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository = UserRepository();

    return Scaffold(
      drawer: AppDrawerPage(userRepository: userRepository),
      appBar: AppBar(
        title: Text('ILMC Groups'),
      ),
      body: Container(
        margin: new EdgeInsets.all(5.0),
        child: _GroupList()
      )
    );
  }
}

class _GroupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GroupsBloc, GroupsState>(
        bloc: BlocProvider.of<GroupsBloc>(context),
        builder: (context,state){
          print(state.toString());
      if(state is GroupsLoading){
        return CircularProgressIndicator();
      }
      if(state is GroupsLoaded){
        return ListView.builder(
            itemCount: state.groups.length,
            itemBuilder: (context,index) => Card(
                child:ListTile(
                  leading: (state.groups[index].image == "")? CircleAvatar(backgroundImage: AssetImage('assets/images/Hellfire-Eight-4inch.png'),radius: 35):CircleAvatar(backgroundImage: NetworkImage(state.groups[index].image)),
                  title: Text(state.groups[index].title,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text('coming soon'),
                  onTap: (){
                    print("Clicked:"+ state.groups[index].id.toString());
                    Navigator.pushReplacementNamed(context, '/group');
                    },
            )));
      }
      return Text('Something Failed!!');
    });
  }
}
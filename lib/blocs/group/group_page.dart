import 'package:blaze_chat/blocs/group/group.dart';
import 'package:blaze_chat/blocs/appdrawer/appdrawer.dart';
import 'package:blaze_chat/user_repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class GroupPage extends StatelessWidget {
  final String title;
  final int id;

  GroupPage(this.title,this.id);

  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository = UserRepository();

    return Scaffold(
        drawer: AppDrawerPage(userRepository: userRepository),
        appBar: AppBar(
          title: Text(title),
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

    return BlocBuilder<GroupBloc, GroupState>(
        bloc: BlocProvider.of<GroupBloc>(context),
        builder: (context,state){
          print(state.toString());
          if(state is GroupLoading){
            return CircularProgressIndicator();
          }
          if(state is GroupLoaded){
            return ListView.builder(
                itemCount: state.messages.length,
                itemBuilder: (context,index) => Card(
                    child:ListTile(
                      //leading: (state.messages[index].image == "")? CircleAvatar(backgroundImage: AssetImage('assets/images/Hellfire-Eight-4inch.png'),radius: 35):CircleAvatar(backgroundImage: NetworkImage(state.groups[index].image)),
                      title: Text(state.messages[index].content,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      subtitle: Text('coming soon'),
                      onTap: (){print("Clicked:"+ state.messages[index].id.toString());},
                    )));
          }
          return Text('Something Failed!!');
        });
  }
}
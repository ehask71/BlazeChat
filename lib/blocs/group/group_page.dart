import 'package:blaze_chat/blocs/group/group.dart';
import 'package:blaze_chat/blocs/appdrawer/appdrawer.dart';
import 'package:blaze_chat/user_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class GroupPage extends StatelessWidget {
  static const routeName = '/group';
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository = UserRepository();
    final GroupArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        drawer: AppDrawerPage(userRepository: userRepository),
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Container(
            margin: new EdgeInsets.all(5.0),
            child: buildBody(context, args.id)
        ),
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: Transform.translate(
          offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
          child: BottomAppBar(
            child: Row(
              children: <Widget>[
                Material(
                  child: new Container(
                    margin: new EdgeInsets.symmetric(horizontal: 1.0),
                    child: new IconButton(
                      icon: new Icon(Icons.image),
                      onPressed: getImage,
                    ),
                  ),
                  color: Colors.white,
                ),
                Expanded(
                    child: TextFormField(
                  controller: _controller,
                  decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.all(5)),
                )),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    print("send Message tapped");
                    submitText(context);
                  },
                )
              ],
            ),
          ),
        ));
  }

  BlocProvider<GroupBloc> buildBody(BuildContext context,int id){
    return BlocProvider(
      create: (_) => GroupBloc(id),
      child: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state){
          if(state is GroupLoading){
            return Center(
                child:SpinKitWanderingCubes(
                  color: Colors.black,
                  size: 50.0,
                )
            );
          }
          if(state is GroupLoaded){
            return ListView.builder(
                itemCount: state.messages.length,
                itemBuilder: (context,index) => Card(
                    child:ListTile(
                      leading: (state.messages[index].image == "")? CircleAvatar(backgroundImage: AssetImage('assets/images/Hellfire-Eight-4inch.png'),radius: 35):CircleAvatar(backgroundImage: NetworkImage(state.messages[index].image)),
                      title: Text(state.messages[index].title,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      subtitle: Text('coming soon'),
                      onTap: (){
                        print("Clicked:"+ state.messages[index].id.toString());
                        Navigator.pushReplacementNamed(context, GroupPage.routeName,
                            arguments: GroupArguments(state.messages[index].id,state.messages[index].title));
                      },
                    )));
          }
          if(state is GroupNotLoaded){

          }
        },
      ),
    );
  }

  void submitText(context) async {
    print("chat field submitted >> " + _controller.text);
    if (_controller.text.length > 0) {
      try {
        _controller.clear();
        FocusScope.of(context).unfocus();
      } catch (e) {}
    }
  }

  Future getImage() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      /*setState(() {
        isLoading = true;
      });
      uploadFile();

       */
    }
  }
}

class _MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GroupArguments args = ModalRoute.of(context).settings.arguments;

    return BlocBuilder<GroupBloc, GroupState>(
        bloc: BlocProvider.of<GroupBloc>(context),
        builder: (context, state) {
          print(state.toString());
          if (state is GroupLoading) {
            return CircularProgressIndicator();
          }
          if (state is GroupLoaded) {
            return ListView.builder(
                itemCount: state.messages.length,
                itemBuilder: (context, index) => Card(
                        child: ListTile(
                      //leading: (state.messages[index].image == "")? CircleAvatar(backgroundImage: AssetImage('assets/images/Hellfire-Eight-4inch.png'),radius: 35):CircleAvatar(backgroundImage: NetworkImage(state.groups[index].image)),
                      title: Text(state.messages[index].content,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      subtitle: Text('coming soon'),
                      onTap: () {
                        print("Clicked:" + state.messages[index].id.toString());
                      },
                    )));
          }
          return Text('Something Failed!!');
        });
  }
}

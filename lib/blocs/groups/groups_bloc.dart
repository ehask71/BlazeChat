import 'dart:async';
import 'dart:io';
import 'package:blaze_chat/blocs/groups/groups.dart';
import 'package:blaze_chat/blocs/home/home.dart';
import 'package:blaze_chat/models/group.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:blaze_chat/user_repository.dart';
import 'package:blaze_chat/group_repository.dart';
import 'groups.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final UserRepository _userRepository;
  final GroupRepository _groupRepository = GroupRepository();

  GroupsBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  GroupsState get initialState => GroupsLoading();

  @override
  Stream<GroupsState> mapEventToState(GroupsEvent event) async* {
    if(event is LoadGroups){
      yield* _mapLoadGroupsToState();
    }
    if(event is NotLoaded){
      yield* _mapGroupsNotLoadedToState();
    }
  }

  Stream<GroupsState> _mapLoadGroupsToState() async* {
    try {
      print('_mapLoadGroupsToState: Enter');
      final _groups = await _groupRepository.fetchGroups(0, 25);
      print(_groups);
      yield GroupsLoaded(groups: _groups);
    } catch (error,stacktrace){
      print(error.toString());
      print(stacktrace.toString());
      yield NotLoaded();
    }
  }

  Stream<GroupsState> _mapGroupsNotLoadedToState() async* {

    yield NotLoaded();
  }

}
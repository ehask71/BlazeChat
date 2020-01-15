import 'dart:async';
import 'dart:io';
import 'package:blaze_chat/blocs/groups/groups.dart';
import 'package:blaze_chat/models/group.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:blaze_chat/user_repository.dart';
import 'package:blaze_chat/group_repository.dart';
import 'groups.dart';
import 'package:blaze_chat/common/constants.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final UserRepository _userRepository;
  final http.Client _httpClient;

  GroupsBloc({@required UserRepository userRepository,@required httpClient})
      : assert(userRepository != null),
        _userRepository = userRepository,assert(httpClient != null),_httpClient = httpClient;

  @override
  GroupsState get initialState => NotLoaded();

  @override
  Stream<GroupsState> mapEventToState(GroupsEvent event) async* {
    if(event is LoadGroups){
      yield* _mapLoadGroupsToState();
    }
    if(event is LoadedGroups){
      yield* _mapLoadedGroupsToState();
    }
    if(event is NotLoaded){
      yield* _mapGroupsNotLoadedToState();
    }
  }

  Stream<GroupsState> _mapLoadGroupsToState() async* {

    yield GroupsLoaded();
  }

  Stream<GroupsState> _mapLoadedGroupsToState() async* {

    yield GroupsLoaded();
  }

  Stream<GroupsState> _mapGroupsNotLoadedToState() async* {

    yield NotLoaded();
  }

}
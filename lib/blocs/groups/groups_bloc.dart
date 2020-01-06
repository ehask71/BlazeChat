import 'dart:async';
import 'dart:io';
import 'package:blaze_chat/blocs/groups/groups.dart';
import 'package:blaze_chat/models/group.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:blaze_chat/user_repository.dart';
import 'groups.dart';
import 'package:blaze_chat/common/constants.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final UserRepository _userRepository;
  final http.Client _httpClient;

  GroupsBloc({@required UserRepository userRepository,@required httpClient})
      : assert(userRepository != null),
        _userRepository = userRepository,assert(httpClient != null),_httpClient = httpClient;

  @override
  GroupsState get initialState => GroupsNotLoaded();

  @override
  Stream<GroupsState> mapEventToState(GroupsEvent event) async* {
    if(event is LoadGroups){
      yield* _mapLoadGroupsToState();
    }
  }

  Stream<GroupsState> _mapLoadGroupsToState() async* {
    yield GroupsLoaded();
  }

  Future<List<Group>> _fetchGroups(int startIndex, int limit) async {

    final token = await _userRepository.getToken();
    final response = await _httpClient.get(
        Constants().API +'groups?_start=$startIndex&_limit=$limit');
  }
}
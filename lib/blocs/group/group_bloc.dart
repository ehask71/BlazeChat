import 'package:blaze_chat/blocs/group/group.dart';
import 'package:bloc/bloc.dart';
import 'package:blaze_chat/group_repository.dart';
import 'package:meta/meta.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final GroupRepository _groupRepository = GroupRepository();
  final int id;

  GroupBloc(this.id);
  @override
  // TODO: implement initialState
  GroupState get initialState => GroupLoading();

  @override
  Stream<GroupState> mapEventToState(GroupEvent event) async* {
    if(event is LoadGroup){
      yield* _mapLoadGroupToState();
    }
    if(event is NotLoaded){
      yield* _mapGroupNotLoadedToState();
    }
  }

  Stream<GroupState> _mapLoadGroupToState() async* {
    try {
      print('_mapLoadGroupToState: Enter');
      final _messages = await _groupRepository.fetchGroup(this.id,0, 25);
      print(_messages);
      yield GroupLoaded(messages: _messages);
    } catch (error) {

    }
  }

  Stream<GroupState> _mapGroupNotLoadedToState() async* {
    yield NotLoaded();
  }

}
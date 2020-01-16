import 'package:blaze_chat/blocs/group/group.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
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

    } catch (error) {

    }
  }

  Stream<GroupState> _mapGroupNotLoadedToState() async* {
    yield NotLoaded();
  }

}
import 'package:equatable/equatable.dart';
import 'package:blaze_chat/models/models.dart';

abstract class GroupsState extends Equatable {
  GroupsState([List props = const []]);

  @override
  List<Object> get props => [];
}

class GroupsLoading extends GroupsState {}

class GroupsLoaded extends GroupsState {
  final List<Group> groups;

  GroupsLoaded({this.groups});

  @override
  String toString() =>
      'GroupsLoaded { posts: ${groups.length} }';
}

class NotLoaded extends GroupsState {}

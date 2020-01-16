import 'package:equatable/equatable.dart';
import 'package:blaze_chat/models/models.dart';

abstract class GroupState extends Equatable {
  GroupState([List props = const []]);

  @override
  List<Object> get props => [];
}

class GroupLoading extends GroupState {}

class GroupLoaded extends GroupState {
  final List<GroupMessage> messages;

  GroupLoaded({this.messages});

  @override
  String toString() =>
      'GroupLoaded { posts: ${messages.length} }';
}

class NotLoaded extends GroupState {}
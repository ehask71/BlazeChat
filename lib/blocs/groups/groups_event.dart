import 'package:equatable/equatable.dart';
import 'package:blaze_chat/models/models.dart';

abstract class GroupsEvent extends Equatable {
  const GroupsEvent();

  @override
  List<Object> get props => [];
}

class LoadGroups extends GroupsEvent {}

class UpdateGroups extends GroupsEvent {}
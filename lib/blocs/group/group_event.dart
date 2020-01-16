import 'package:equatable/equatable.dart';
import 'package:blaze_chat/models/models.dart';

abstract class GroupEvent extends Equatable {
  const GroupEvent();

  @override
  List<Object> get props => [];
}

class LoadGroup extends GroupEvent {}

class LoadedGroup extends GroupEvent {}

class UpdateGroup extends GroupEvent {}

class GroupNotLoaded extends GroupEvent {}
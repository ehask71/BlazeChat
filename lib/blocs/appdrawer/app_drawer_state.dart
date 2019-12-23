import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AppDrawerState extends Equatable {
  const AppDrawerState();

  @override
  List<Object> get props => [];
}

class InitialAppDrawerState extends AppDrawerState {
  @override
  String toString() => 'InitialAppDrawerState';
}
class LoadingAppDrawerState extends AppDrawerState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoadingAppDrawerState';
}
class LoadedAppDrawerState extends AppDrawerState {
  final String displayName;

  const LoadedAppDrawerState({@required this.displayName});

  @override
  List<Object> get props => [displayName];

  @override
  String toString() => 'LoadedAppDrawerState {user: $displayName}';
}
class ErrorAppDrawerState extends AppDrawerState {
  ErrorAppDrawerState();

  @override
  String toString() => 'ErrorAppDrawerError';
}
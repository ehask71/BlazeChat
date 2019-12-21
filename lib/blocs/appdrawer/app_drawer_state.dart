import 'package:equatable/equatable.dart';

abstract class AppDrawerState extends Equatable {
  const AppDrawerState();

  @override
  List<Object> get props => [];
}

class InitialAppDrawerState extends AppDrawerState {}
class LoadingAppDrawerState extends AppDrawerState {}
class LoadedAppDrawerState extends AppDrawerState {
  @override
  List<Object> get props => [];
}
class ErrorAppDrawerState extends AppDrawerState {}
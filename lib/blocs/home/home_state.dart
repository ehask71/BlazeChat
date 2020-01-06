import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends HomeState {}

class Initialized extends HomeState {}

class Loading extends HomeState {}

class Loaded extends HomeState {}

class Update extends HomeState {}
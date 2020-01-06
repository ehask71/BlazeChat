import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInit extends HomeEvent {}

class HomeLoading extends HomeEvent {}

class HomeLoaded extends HomeEvent {}

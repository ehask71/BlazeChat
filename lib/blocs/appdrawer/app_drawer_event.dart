import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AppDrawerEvent extends Equatable {
  const AppDrawerEvent();

  @override
  List<Object> get props => [];
}

class InitialAppDrawer extends AppDrawerEvent {}
class LoadingAppDrawer extends AppDrawerEvent {}
class LoadedAppDrawer extends AppDrawerEvent {}

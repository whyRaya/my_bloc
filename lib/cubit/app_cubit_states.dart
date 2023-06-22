import 'package:equatable/equatable.dart';

import '../services/data_model.dart';

abstract class CubitStates extends Equatable {


}

class InitialState extends CubitStates {
  @override
  List<Object> get props => [];

}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [];

}

class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];

}

class LoadedState extends CubitStates {
  LoadedState(this.data);
  final dynamic data;
  @override
  List<Object> get props => [];

}


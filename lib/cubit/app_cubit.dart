import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/cubit/app_cubit_states.dart';
import 'package:my_bloc/services/data_model.dart';
import 'package:my_bloc/services/data_services.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit(this.data) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  List<DataModel>? places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places!));
    } catch (e) {
      print(e);
    }
  }

  void backToWelcomePage() async {
    try {
      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(WelcomeState());
    } catch (e) {
      print(e);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/pages/home_page.dart';
import 'package:my_bloc/pages/main_page.dart';
import 'package:my_bloc/pages/todo/todo_pages.dart';
import 'package:my_bloc/pages/welcome_page.dart';

import 'app_cubit.dart';
import 'app_cubit_states.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({super.key});

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            print("WelcomeState");
            return const WelcomePage();
          } else if (state is LoadedState) {
            print("LoadedState");
            return const MainPage();
          } else if (state is LoadingState) {
            print("LoadingState");
            return const Center(child: CircularProgressIndicator());
          } else {
            print("HomePage");
            return const HomePage();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_task/bloc/User/user_cubit.dart';
import 'package:general_task/bloc/note/note_cubit.dart';
import 'package:general_task/views/splash_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => UserCubit(),),
        BlocProvider(create: (BuildContext context) => NoteCubit(),),
      ],
      child: MaterialApp(
        home: SplachScreen(),
      ),
    );
  }
}

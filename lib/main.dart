import 'package:estudostate/model/cubit/app_navigator.dart';
import 'package:estudostate/model/cubit/nav_cubit.dart';
import 'package:estudostate/model/cubit/postscubit.dart';
import 'package:estudostate/screens/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiBlocProvider(providers: [
          BlocProvider(create: (context) => NavCubit()),
          BlocProvider(
            create: (context) => PostsBloc()..add(LoadPostsEvent()),
          )
        ], child: AppNavigator()));
  }
}
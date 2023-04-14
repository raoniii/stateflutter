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
        home: BlocProvider<PostsCubit>(
            create: (context) => PostsCubit()..getPosts(), child: PostsView()));
  }
}

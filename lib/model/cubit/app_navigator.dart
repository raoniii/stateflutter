import 'package:estudostate/model/cubit/nav_cubit.dart';
import 'package:estudostate/model/posts/posts_model.dart';
import 'package:estudostate/screens/post_details.dart';
import 'package:estudostate/screens/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {

  const AppNavigator({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post?>(builder: (context, post) {
      return Navigator(
        pages: [
          MaterialPage(child: PostsView()),
          if (post != null) MaterialPage(child: PostDetailsView(post: post))
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPosts();
          return route.didPop(result);
        },
      );
    });
  }
}

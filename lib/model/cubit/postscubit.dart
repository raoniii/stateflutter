import 'package:estudostate/model/posts/data_service.dart';
import 'package:estudostate/model/posts/posts_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getPosts());
}

abstract class PostsEvent {}

class LoadPostsEvent extends PostsEvent {}

class PullToRefreshEvent extends PostsEvent {}

abstract class PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  late List<Post> posts;

  LoadedPostsState({required this.posts});
}

class FailedToLoadPostsState extends PostsState {
  late Error error;

  FailedToLoadPostsState({required this.error});
}

@override
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataService = DataService();

  PostsBloc() : super(LoadedPostsState(posts: [])) {
    on((event, emit) async {
      try {
        final data = await _dataService.getPosts();
        if (event is PullToRefreshEvent || event is LoadPostsEvent) {
          emit(LoadedPostsState(posts: data));
        }
      } on Error catch (e) {
        emit(FailedToLoadPostsState(error: e));
      }
    });
  }
}

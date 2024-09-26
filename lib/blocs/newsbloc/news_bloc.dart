import 'package:news_app/blocs/newsbloc/news_events.dart';
import 'package:news_app/blocs/newsbloc/news_states.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/repositories/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  NewsRepository newsRepositoty;
  NewsBloc({required NewsStates initialState, required this.newsRepositoty})
      : super(initialState) {
    add(StartEvent());
  }

  @override
  Stream<NewsStates> mapEventToState(NewsEvents event) async* {
    if (event is StartEvent) {
      try {
        List<ArticleModel> articleList = [];
        yield NewsLoadingState();
        articleList = await newsRepositoty.fetchNews();
        yield NewsLoadedState(articleList: articleList);
      } catch (e) {
        yield NewsErrorState(errorMessage: e.toString());
      }
    }
  }
}

//bloc completed

// let's deploy this bloc in ui

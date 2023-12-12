// ignore: depend_on_referenced_packages
import 'package:app_solidale/screens/news/model/list_news_model.dart';
import 'package:app_solidale/screens/news/repository/news_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  int page = 1;
  bool isFetching = false;
  ScrollController scrollController = ScrollController();
  final NewsRepository newsRepository;
    final BuildContext context;

  NewsBloc({required this.context, required this.newsRepository,}) : super(NewsLoadingState()) {
      scrollController.addListener(() {
                          if (scrollController.offset ==
                                  scrollController.position.maxScrollExtent &&
                              !isFetching) {
                            isFetching = true;
                              add(FetchNewsEvent());
                          }
                        });
   
    on<FetchNewsEvent>((event, emit) async {
      emit(NewsLoadingState());
      try {
        final news = await newsRepository.getListNews(context,page);
        emit(NewsLoadedState(news));
        page++;
      } catch (e) {
        emit(NewsErrorState(e.toString()));
      }
    });
    
  }
}
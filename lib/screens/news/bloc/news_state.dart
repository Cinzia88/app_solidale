part of 'news_bloc.dart';


abstract class NewsState extends Equatable {}

class NewsLoadingState extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoadedState extends NewsState {
  final List<ListNewsModel> news;

  NewsLoadedState(this.news);

  @override
  List<Object?> get props => [news];
}

class NewsErrorState extends NewsState {
  final String error;

  NewsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
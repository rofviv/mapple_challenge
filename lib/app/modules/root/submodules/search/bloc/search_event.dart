part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class OnChangeGettingNextPage extends SearchEvent {
  final bool value;

  const OnChangeGettingNextPage(this.value);
}

class OnChangeLoading extends SearchEvent {
  final bool loading;

  const OnChangeLoading(this.loading);
}

class OnChangeQuery extends SearchEvent {
  final String text;

  const OnChangeQuery(this.text);
}

class OnChangeSearchRecent extends SearchEvent {
  final List<String> list;

  const OnChangeSearchRecent(this.list);
}

class OnAddSearchRecent extends SearchEvent {
  final String text;

  const OnAddSearchRecent(this.text);
}

class OnChangeResults extends SearchEvent {
  final List<ProductSearch> list;

  const OnChangeResults(this.list);
}

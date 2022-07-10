part of 'search_bloc.dart';

class SearchState extends Equatable {
  final bool gettingNextPage;
  final bool loading;
  final String query;
  final List<String> searchRecent;
  final List<ProductSearch> results;
  const SearchState({
    this.gettingNextPage = false,
    this.loading = false,
    this.query = "",
    this.searchRecent = const [],
    this.results = const [],
  });

  SearchState copyWith({
    bool? gettingNextPage,
    bool? loading,
    String? query,
    List<String>? searchRecent,
    List<ProductSearch>? results,
  }) =>
      SearchState(
        gettingNextPage: gettingNextPage ?? this.gettingNextPage,
        loading: loading ?? this.loading,
        query: query ?? this.query,
        searchRecent: searchRecent ?? this.searchRecent,
        results: results ?? this.results,
      );

  @override
  List<Object> get props => [
        gettingNextPage,
        loading,
        query,
        searchRecent,
        results,
      ];
}

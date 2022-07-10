part of 'history_bloc.dart';

class HistoryState extends Equatable {
  final bool loading;
  final List<ProductSearch> listItems;
  const HistoryState({
    this.loading = true,
    this.listItems = const [],
  });

  HistoryState copyWith({
    bool? loading,
    List<ProductSearch>? listItems,
  }) => HistoryState(
    loading: loading ?? this.loading,
    listItems: listItems ?? this.listItems
  );
  
  @override
  List<Object> get props => [
    loading,
    listItems,
  ];
}

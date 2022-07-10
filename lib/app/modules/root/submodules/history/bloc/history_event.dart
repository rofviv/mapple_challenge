part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class OnChangeItemList extends HistoryEvent {
  final List<ProductSearch> list;

  const OnChangeItemList(this.list);
}

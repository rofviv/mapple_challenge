part of 'root_bloc.dart';

abstract class RootEvent extends Equatable {
  const RootEvent();

  @override
  List<Object> get props => [];
}

class OnChangeIndex extends RootEvent {
  final int index;

  const OnChangeIndex(this.index);
}

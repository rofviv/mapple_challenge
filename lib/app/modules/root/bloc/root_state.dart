part of 'root_bloc.dart';

class RootState extends Equatable {
  final int currentIndex;
  const RootState({
    this.currentIndex = 0,
  });

  RootState copyWith({
    int? currentIndex,
  }) =>
      RootState(
        currentIndex: currentIndex ?? this.currentIndex,
      );

  @override
  List<Object> get props => [
        currentIndex,
      ];
}

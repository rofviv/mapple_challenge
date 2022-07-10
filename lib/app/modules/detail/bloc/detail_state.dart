part of 'detail_bloc.dart';

class DetailState extends Equatable {
  final bool loading;
  final ItemProductDto? itemProduct;
  const DetailState({
    this.loading = true,
    this.itemProduct,
  });

  DetailState copyWith({
    bool? loading,
    ItemProductDto? itemProduct,
  }) =>
      DetailState(
        loading: loading ?? this.loading,
        itemProduct: itemProduct ?? this.itemProduct,
      );

  @override
  List<Object?> get props => [
        loading,
        itemProduct,
      ];
}

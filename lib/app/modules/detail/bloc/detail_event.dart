part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class OnChangeLoading extends DetailEvent {
  final bool loading;

  const OnChangeLoading(this.loading);
}

class OnChangeItemProduct extends DetailEvent {
  final ItemProductDto itemProduct;

  const OnChangeItemProduct(this.itemProduct);
}

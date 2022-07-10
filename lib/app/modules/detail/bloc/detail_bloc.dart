import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../domain/models/item_product_dto.dart';
import '../domain/repositories/detail_repository.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailRepository _detailRepository;
  DetailBloc({required DetailRepository detailRepository})
      : _detailRepository = detailRepository,
        super(const DetailState()) {
    on<OnChangeLoading>((event, emit) {
      emit(state.copyWith(loading: event.loading));
    });

    on<OnChangeItemProduct>((event, emit) {
      emit(state.copyWith(itemProduct: event.itemProduct, loading: false));
    });
  }

  void loadDetailProduct(String id) async {
    final res = await _detailRepository.getItem(id: id);
    if (res.status == 200) {
      add(OnChangeItemProduct(res.data!));
    }
  }
}

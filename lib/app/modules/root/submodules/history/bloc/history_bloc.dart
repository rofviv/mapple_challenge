import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mapple_challenge/app/modules/root/models/product_search.dart';

import '../../../../../domain/repositories/preferences_repository.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final PreferencesRepository _preferencesRepository;

  HistoryBloc({required PreferencesRepository preferencesRepository})
      : _preferencesRepository = preferencesRepository,
        super(const HistoryState()) {
    on<OnChangeItemList>((event, emit) {
      emit(state.copyWith(listItems: event.list, loading: false));
    });

    _init();
  }

  void _init() {
    final list = _preferencesRepository.itemsVisited;
    add(OnChangeItemList(ProductSearch.fromListJson(list)));
  }

  void clearItemList() {
    _preferencesRepository.clearItems();
    add(const OnChangeItemList([]));
  }
}

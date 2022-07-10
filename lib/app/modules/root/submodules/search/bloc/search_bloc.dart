import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/repositories/preferences_repository.dart';
import '../../../models/product_search.dart';
import '../domain/repositories/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final PreferencesRepository _preferencesRepository;
  final SearchRepository _searchRepository;
  Timer? debounce;
  TextEditingController searchTextCtrl = TextEditingController(text: '');
  ScrollController scrollController = ScrollController();
  int page = 0;

  SearchBloc({
    required PreferencesRepository preferencesRepository,
    required SearchRepository searchRepository,
  })  : _preferencesRepository = preferencesRepository,
        _searchRepository = searchRepository,
        super(const SearchState()) {
    on<OnChangeLoading>((event, emit) {
      emit(state.copyWith(loading: event.loading));
    });

    on<OnChangeQuery>((event, emit) {
      if (event.text.isEmpty || event.text.length < 3) {
        emit(state.copyWith(query: event.text, loading: false, results: []));
      } else {
        emit(state.copyWith(query: event.text, loading: true));
        search();
      }
    });

    on<OnChangeSearchRecent>((event, emit) {
      emit(state.copyWith(searchRecent: event.list));
    });

    on<OnAddSearchRecent>((event, emit) {
      final tmp = [...state.searchRecent];
      if (tmp.where((element) => element == event.text).isEmpty) {
        if (tmp.length >= 5) {
          tmp.removeLast();
        }
        if (event.text.isNotEmpty) {
          tmp.insert(0, event.text);
        }
        emit(state.copyWith(searchRecent: tmp));
        _preferencesRepository.saveSearchs(state.searchRecent);
      }
    });

    on<OnChangeResults>((event, emit) {
      emit(state.copyWith(results: event.list, loading: false));
    });

    on<OnChangeGettingNextPage>((event, emit) {
      emit(state.copyWith(gettingNextPage: event.value));
    });

    _init();
  }

  void _init() {
    final list = _preferencesRepository.searchRecent;
    add(OnChangeSearchRecent(list));
  }

  void search() async {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(
      const Duration(milliseconds: 1500),
      () async {
        if (state.query.isNotEmpty) {
          page = 0;
          final res =
              await _searchRepository.search(query: state.query, page: page);
          List<ProductSearch> list = [];

          if (res.status == 200) {
            add(OnAddSearchRecent(state.query));
            list = res.data!.results;
          }
          add(OnChangeResults(list));
        }
      },
    );
  }

  void getNextPage(int page) async {
    if (!state.gettingNextPage) {
      add(const OnChangeGettingNextPage(true));
      this.page = page;
      final res =
          await _searchRepository.search(query: state.query, page: this.page);
      List<ProductSearch> list = [];

      if (res.status == 200) {
        add(OnAddSearchRecent(state.query));
        list = res.data!.results;
      }
      add(OnChangeResults([...state.results, ...list]));
      add(const OnChangeGettingNextPage(false));
    }
  }

  void saveItemHistory(ProductSearch product) {
    _preferencesRepository.saveItems(product.toJson());
  }

  void clearSearchRecent() {
    _preferencesRepository.clearSearchs();
    add(const OnChangeSearchRecent([]));
  }
}

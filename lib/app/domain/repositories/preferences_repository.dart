import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesRepository {
  List<String> get searchRecent;
  List<String> get itemsVisited;
  void saveSearchs(List<String> list);
  void saveItems(String item);
  void clearSearchs();
  void clearItems();
}

const searchKey = "mapple-search-key";
const itemKey = "mapple-item-key";

class PreferencesRepositoryImpl extends PreferencesRepository {
  final SharedPreferences _preferences;

  PreferencesRepositoryImpl(this._preferences);

  @override
  List<String> get itemsVisited {
    return _preferences.getStringList(itemKey) ?? [];
  }

  @override
  List<String> get searchRecent {
    return _preferences.getStringList(searchKey) ?? [];
  }

  @override
  void saveSearchs(List<String> list) async {
    await _preferences.setStringList(searchKey, list);
  }

  @override
  void saveItems(String item) async {
    List<String> list = itemsVisited;
    if (list.length >= 5) {
      list.removeLast();
    }
    if (list.where((element) => element == item).isEmpty) {
      list.insert(0, item);
    }
    await _preferences.setStringList(itemKey, list);
  }

  @override
  void clearItems() {
    _preferences.remove(itemKey);
  }

  @override
  void clearSearchs() {
    _preferences.remove(searchKey);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get_di_sample/di/injection_container.dart';
import 'package:get_di_sample/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'second_service.dart';

class SecondController {

  ValueNotifier<FetchState> state = ValueNotifier(FetchState());
  final SecondService _service = serviceLocator.get();

  void init() {
    print('controller: initialized');
    _fetchData();
  }

  void _fetchData() async {
    state.value = Loading();
    try {
      Model data = await _service.fetchData();
      state.value = Fetched(data);
    }
    catch (e){
      if(e is Exception) state.value = Error(e);
    }
  }

  final SharedPreferences _prefs = serviceLocator.get();
  ValueNotifier<String> textInPrefs = ValueNotifier("");

  void getTextInPrefs(){
    textInPrefs.value = _prefs.getString('name')!;
  }

  void dispose() {
    state = ValueNotifier(FetchState());
    textInPrefs = ValueNotifier("");
    print('controller: disposed');
  }
}
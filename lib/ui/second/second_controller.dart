import 'package:get/get.dart';
import 'package:get_di_sample/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'second_service.dart';

class SecondController extends GetxController{

  final Rx<FetchState> state = FetchState().obs;
  final SecondService _service = Get.find<SecondService>();

  void fetchData() async {
    state.value = Loading();
    try {
      Model data = await _service.fetchData();
      state.value = Fetched(data);
    }
    catch (e){
      if(e is Exception) state.value = Error(e);
    }
  }

  final SharedPreferences _prefs = Get.find();
  final RxString _textInPrefs = "".obs;
  String get textInPrefs => _textInPrefs.value;

  void getTextInPrefs(){
    _textInPrefs.value = _prefs.getString('name')!;
  }
}

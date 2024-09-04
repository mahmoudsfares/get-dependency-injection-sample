import 'package:get/get.dart';
import 'package:get_di_sample/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'second_service.dart';

class SecondController extends GetxController {

  final SecondService _service = Get.find<SecondService>();
  FetchState state = FetchState();

  @override
  void onInit() {
    super.onInit();
    _fetchData();
  }

  void _fetchData() async {
    state = Loading();
    try {
      Model data = await _service.fetchData();
      state = Fetched(data);
    }
    catch (e){
      if(e is Exception) state = Error(e);
    }
    update();
  }

  final SharedPreferences _prefs = Get.find();
  String textInPrefs = "";

  void getTextInPrefs(){
    textInPrefs = _prefs.getString('name')!;
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

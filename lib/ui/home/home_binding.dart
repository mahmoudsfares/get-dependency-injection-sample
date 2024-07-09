import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // for SharedPreferences and database instances,
    // dependencies must be injected asynchronously
    // the permanent attribute is to prevent SmartManager from deleting the instance
    // after the widget that it has been injected to is destroyed. this is useful
    // in case of injecting a dependency in splash screen or so.
    Get.putAsync(() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', 'Batman');
      return prefs;
    }, permanent: true);
  }
}

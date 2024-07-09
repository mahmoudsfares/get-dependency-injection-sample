import 'package:get_di_sample/ui/second/second_controller.dart';
import 'package:get_di_sample/ui/second/second_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString('name', 'Batman');
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  serviceLocator.registerLazySingleton(() => SecondService());
  serviceLocator.registerLazySingleton(() => SecondController());
}
import 'package:get_di_sample/ui/second/second_controller.dart';
import 'package:get_di_sample/ui/second/second_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString('name', 'Batman');
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  // recalls same instance of the dependency
  serviceLocator.registerLazySingleton(() => SecondService());
  // creates new one whenever the dependency was needed
  serviceLocator.registerFactory(() => SecondController());
}
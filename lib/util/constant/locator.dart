import 'package:aviato/core/view_model/startup_vm.dart';
import 'package:aviato/core/view_model/error_model.dart';
import 'package:aviato/util/dialog_service.dart';
import 'package:aviato/util/navigator.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';





GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());



  locator.registerFactory(() => StartUpViewModel());


  // locator.registerLazySingleton(() => WeatherApi());
  // locator.registerFactory(() => WeatherViewModel());


}

final List<SingleChildWidget> allProviders = <SingleChildWidget>[
  ChangeNotifierProvider<WeatherViewModel>(create: (_) => WeatherViewModel()),


];

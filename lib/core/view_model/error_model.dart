import 'package:aviato/util/error/custom_exception.dart';
import 'base_vm.dart';




class WeatherViewModel extends BaseModel {
  // final WeatherApi _weatherApi = locator<WeatherApi>();
  String error1;
  String error2;
  String error3;
  String token;

 

  void showErrorDialog(CustomException e) {
    dialog.showDialog(
        title: 'Error', description: e.message, buttonTitle: 'Close');
  }
}

import 'package:aviato/core/storage/local_storage.dart';
import 'package:aviato/util/constant/routes.dart';
import 'base_vm.dart';

class StartUpViewModel extends BaseModel {
  bool hasLoggedIn = false;

  Future<void> isLoggedIn() async {
    final String token = AppCache.getTimeZone();
    if (token != null ) {
      hasLoggedIn = true;
      // Future<void>.delayed(const Duration(seconds: 2), () {
        navigate.navigateToReplacing(HomeScreenView);
      // });
    } else
      // Future<void>.delayed(const Duration(seconds: 2), () {
        navigate.navigateToReplacing(HomeScreenView);
      // });

    notifyListeners();
  }
}

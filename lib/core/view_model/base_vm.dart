import 'package:aviato/util/constant/locator.dart';
import 'package:aviato/util/dialog_service.dart';
import 'package:aviato/util/navigator.dart';
import 'package:flutter/material.dart';


class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  DialogService dialog = locator<DialogService>();
  NavigationService navigate = locator<NavigationService>();

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}

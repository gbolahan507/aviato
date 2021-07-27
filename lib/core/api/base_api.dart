import 'package:aviato/util/constant/locator.dart';
import 'package:aviato/util/constant/messages.dart';
import 'package:aviato/util/navigator.dart';
import 'package:dio/dio.dart';



class BaseAPI {
  Dio dio = Dio();

  String baseUrl = kBaseUrl;
  Options defaultOptions = Options(
      sendTimeout: 20000, // 20 seconds
      receiveTimeout: 20000, // 20 seconds
      // contentType: 'application/json',
      validateStatus: (status) => status < 500);
  NavigationService navigate = locator<NavigationService>();
}



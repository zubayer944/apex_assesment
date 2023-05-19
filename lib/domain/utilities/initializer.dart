import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../presentation/widgets/common_widgets/custom_error_widgets.dart';
import '../repositories/api_helper.dart';
import '../repositories/api_helper_impl.dart';
import 'log_print.dart';

class Initializer {
  static const Initializer instance = Initializer._internal();

  factory Initializer() => instance;

  const Initializer._internal();

  void init(VoidCallback runApp) {

    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
      };

      ErrorWidget.builder = (errorDetails) {
        return CustomErrorWidget(
          message: errorDetails.exceptionAsString(),
        );
      };

      await _initServices();

      runApp();

    }, (error, StackTrace stackTrace) {
      LogPrint.print(error.toString());
    });
  }

  Future<void> _initServices() async {
    try {

      await _initStorage();
      _initScreenPreference();

    } catch (err) {
      rethrow;
    }
  }

  Future<void> _initStorage() async {
  }

  /// screen will always [portraitUp] and [portraitDown]
  void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiHelper>(ApiHelperImpl());
  }
}
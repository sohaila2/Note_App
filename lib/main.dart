import 'package:flutter/material.dart';
import 'package:general_task/services/dio_helper/dio_service.dart';
import 'package:general_task/services/sp_helper/cache_helper.dart';
import 'package:general_task/src/app_root.dart';

Future<void> main()

async {

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  DioHelper.init();
  runApp(AppRoot());
}
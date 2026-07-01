import 'package:flutter/material.dart';
import 'package:task_manager/myApp.dart';

import 'controller/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AuthController.getUserData();
  runApp(MyApp());
}
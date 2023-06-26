import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parket/app/park_et.dart';
import 'package:parket/core/di/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setDI();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ParkEt());
}


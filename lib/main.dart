import'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parket/app/park_et.dart';
import 'package:parket/core/di/get_it.dart';
import 'package:parket/core/models/park.dart';
import 'package:parket/firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setDI();
  await Hive.initFlutter();
  Hive.registerAdapter(ParkAdapter());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ParkEt());
}


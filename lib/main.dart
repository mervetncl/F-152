import 'package:flutter/material.dart';
import 'package:parket/app/park_et.dart';
import 'package:parket/core/di/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setDI();
  runApp(const ParkEt());
}


import 'package:hive_flutter/hive_flutter.dart';

class Repository{
  Box? _favouredMealsBox;
  Box? get favouredMealsBox => _favouredMealsBox;
  setFavouredMeals(Box meals) {
    _favouredMealsBox = meals;
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parket/app/app_base_view_model.dart';

class SaticiHomeViewModel extends AppBaseViewModel{
  int _currentTabIndex = 0;

  int get currentIndex => _currentTabIndex;
  bool _reverse = false;

  bool get reverse => _reverse;

  init() {}

  setTabIndex(int value) {
    if (value < _currentTabIndex) {
      _reverse = true;
    }
    _currentTabIndex = value;
    notifyListeners();
  }
  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
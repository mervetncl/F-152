import 'package:parket/app/app_base_view_model.dart';

class CreditCardViewModel extends AppBaseViewModel{
  double? toplam;
  var args;

  init(){
    args = navigationService.currentArguments;
    toplam = double.parse(args.toString());
    notifyListeners();
  }
}
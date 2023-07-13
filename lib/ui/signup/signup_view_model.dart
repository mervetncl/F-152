import 'package:flutter/material.dart';
import 'package:parket/app/app_base_view_model.dart';

class SignUpViewModel extends AppBaseViewModel{
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController passTekrarController;
  init(){
    emailController = TextEditingController();
    passController = TextEditingController();
    passTekrarController = TextEditingController();
  }
}
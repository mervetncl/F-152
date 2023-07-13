import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parket/app/app.router.dart';
import 'package:parket/app/app_base_view_model.dart';

class LoginViewModel extends AppBaseViewModel{
  late TextEditingController emailController;
  late TextEditingController passController;

  init() async {
    emailController = TextEditingController();
    passController = TextEditingController();
  }
}
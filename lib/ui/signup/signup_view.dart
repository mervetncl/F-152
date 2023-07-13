import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parket/app/app.router.dart';
import 'package:parket/common/constants/colors.dart';
import 'package:parket/ui/signup/signup_view_model.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: bgColor,
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            const SizedBox(height: 80.0),
                            const Text(
                              'Park Et',
                              style: TextStyle(
                                color: academyBlack,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 48.0),
                            const Divider(
                              color: academyBlue,
                              thickness: 2,
                            ),
                            const SizedBox(height: 48.0),
                            const Text(
                              "Hesap Oluştur",
                              textScaleFactor: 2,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              style: const TextStyle(color: Colors.black),
                              controller: model.emailController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              style: const TextStyle(color: Colors.black),
                              controller: model.passController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
                                labelText: 'Parola',
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              style: const TextStyle(color: Colors.black),
                              controller: model.passTekrarController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
                                labelText: 'Parola tekrar',
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: const EdgeInsets.all(15),
                              shape: const StadiumBorder(),
                              backgroundColor: academyYellow),
                          onPressed: () async {
                            if (validateField(
                                    model.emailController.text,
                                    model.passController.text,
                                    model.passTekrarController.text) ==
                                true) {
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: model.emailController.text,
                                  password: model.passController.text,
                                );

                                // go to satici panel
                                await model.navigationService.navigateTo(Routes.saticiHomeView);
                              } catch (e) {
                                Fluttertoast.showToast(
                                    msg: e.toString(),
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                      "Alanları Doğru Doldurduğunuzdan Emin Olun",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                          child: const Text("Kaydol")),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            model.navigationService
                                .navigateTo(Routes.signInView);
                          },
                          child: const Text(
                            "Hesabınız var mı? Giriş Yap",
                            style: TextStyle(color: academyDGray),
                          ))
                    ],
                  ),
                ),
              ),
            ));
  }

  bool validateField(String email, String pass, String passTekrar) {
    if (email != "" && pass.length >= 3 && pass == passTekrar) {
      return true;
    } else {
      return false;
    }
  }
}

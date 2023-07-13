import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parket/app/app.router.dart';
import 'package:parket/common/constants/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'signin_view_model.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => SafeArea(
                child: Scaffold(
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
                            const SizedBox(height: 30.0),
                            Image.asset('assets/parkicon.png'),
                            const SizedBox(height: 30.0),
                            const Divider(
                              color: academyBlue,
                              thickness: 2,
                            ),
                            const SizedBox(height: 48.0),
                            const Text(
                              "Giriş Yap",
                              textScaleFactor: 1.5,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              style: const TextStyle(color: academyBlack),
                              controller: model.emailController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                                labelText: 'E-Posta',
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            TextField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              style: const TextStyle(color: academyBlack),
                              controller: model.passController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
                                labelText: 'Şifre',
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: const EdgeInsets.all(15),
                              shape: const StadiumBorder(),
                              backgroundColor: academyYellow),
                          onPressed: () async {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: model.emailController.text,
                                      password: model.passController.text);
                              // go to satici panel
                              Navigator.pop(context);
                             await model.navigationService.navigateTo(Routes.saticiHomeView);

                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                Fluttertoast.showToast(
                                    msg: "Kullanıcı Bulunamadı",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              } else if (e.code == 'wrong-password') {
                                Fluttertoast.showToast(
                                    msg: "Parola Yanlış",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );                              }
                            }
                          },
                          child: const Text(
                            "Giriş Yap",
                            style: TextStyle(color: academyBlack),
                          )),
                      const SizedBox(height: 15.0),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            model.navigationService.navigateTo(Routes.signUpView);
                          },
                          child: const Text(
                            "Hesabınız yok mu? Kaydol",
                            style: TextStyle(color: academyDGray),
                          ))
                    ],
                  ),
                ),
              ),
            )));
  }
}

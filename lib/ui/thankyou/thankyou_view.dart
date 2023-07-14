// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:parket/app/app.router.dart';
import 'package:parket/common/widgets/home_button.dart';
import 'package:parket/ui/thankyou/thankyou_view_model.dart';
import 'package:stacked/stacked.dart';

class ThankYouPage extends StatelessWidget {
  ThankYouPage({Key? key}) : super(key: key);

  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xFF32567A);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return ViewModelBuilder<ThankYouViewModel>.reactive(
        viewModelBuilder: () => ThankYouViewModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 170,
                      padding: EdgeInsets.all(35),
                      decoration: BoxDecoration(
                        color: themeColor,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/card.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.1),
                    Text(
                      "Teşekkürler!",
                      style: TextStyle(
                        color: themeColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 36,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "Ödeme Başarılı",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Text(
                      "Kısa süre içinde ana sayfaya yönlendirileceksiniz\nveya ana sayfaya dönmek için burayı tıklayın",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.06),
                    Flexible(
                      child: HomeButton(
                        title: 'Ana Sayfa',
                        onTap: () {
                          model.navigationService.navigateTo(Routes.homeView);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}

Color themeColor = const Color(0xFF43D19E);

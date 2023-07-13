import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:parket/app/app.router.dart';
import 'package:parket/ui/credit/credit_card_view_model.dart';
import 'package:stacked/stacked.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({Key? key}) : super(key: key);

  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreditCardViewModel>.reactive(
        viewModelBuilder: () => CreditCardViewModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.teal[50],
              appBar: AppBar(
                leading: BackButton(
                  onPressed: (){
                    model.navigationService.navigateTo(Routes.homeView);
                  },
                ),
                automaticallyImplyLeading: false,
                title: const Text(
                  'Ödeme',
                  textAlign: TextAlign.center,
                ),
              ),
              resizeToAvoidBottomInset: true,
              body: SafeArea(
                child: Column(
                  children: [
                    CreditCardWidget(
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      showBackView: isCvvFocused,
                      obscureCardNumber: true,
                      obscureCardCvv: true,
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 5)),
                    Text(
                      "Toplam : ${model.toplam}",
                      style: const TextStyle(fontSize: 15),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CreditCardForm(
                            cardNumber: cardNumber,
                            expiryDate: expiryDate,
                            cardHolderName: cardHolderName,
                            cvvCode: cvvCode,
                            onCreditCardModelChange: onCreditCardModelChange,
                            themeColor: Colors.blue,
                            formKey: formKey,
                            cardNumberDecoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Kart Numarası',
                                hintText: 'xxxx xxxx xxxx xxxx'),
                            expiryDateDecoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Son Kullanma',
                                hintText: 'AA/YY'),
                            cvvCodeDecoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'CVV',
                                hintText: 'xxx'),
                            cardHolderDecoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Kart Kaydet',
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                backgroundColor: const Color(0xff1b447b)),
                            child: Container(
                              margin: const EdgeInsets.all(8.0),
                              child: const Text(
                                'ÖDE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'halter',
                                  fontSize: 14,
                                  package: 'flutter_credit_card',
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                print('valid');
                              } else {
                                print('inValid');
                              }
                            },
                          )
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ));
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

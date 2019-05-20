import 'package:EventIt/widgets/profile/models/credit_card_model.dart';
import 'package:EventIt/widgets/profile/models/payment_model.dart';
import 'package:EventIt/widgets/profile/models/user_model.dart';
import 'package:flutter/material.dart';

List<CreditCardModel> getCreditCards() {
  List<CreditCardModel> creditCards = [];
  creditCards.add(
      CreditCardModel("Florian", "sabaniflorian@gmail.com", "", "23", "192"));
  creditCards.add(
      CreditCardModel("Andrea", "andreadattero@gmail.com", "", "33", "217"));
  return creditCards;
}

List<UserModel> getUsersCard() {
  List<UserModel> userCards = [
    UserModel("Andrea", ""),
    UserModel("David", ""),
    UserModel("Federico", ""),
    UserModel("Davide", ""),
    UserModel("Matilde", ""),
    UserModel("Bendetta", ""),
    UserModel("Silvia", ""),
  ];

  return userCards;
}

List<PaymentModel> getPaymentsCard() {
  List<PaymentModel> paymentCards = [
    PaymentModel(Icons.directions_run, Color(0xFFffd60f),
        "Corsa Al San Giugliano", "07-23-2019", "20.04 - 22.30", 7, -1),
    PaymentModel(Icons.hdr_weak, Color(0xFFff415f), "Lido di Jesolo",
        "04-03-2019", "14.01 - 18.00", 5, -1),
    PaymentModel(Icons.fastfood, Color(0xFF50f3e2), "Grigliata coi fioi",
        "03-13-2019", "10.04 - 21.00", 8, -1),
    PaymentModel(Icons.watch_later, Colors.green, "Cinema Pikachu",
        "02-11-2019", "09.04", 13, -1),
  ];

  return paymentCards;
}

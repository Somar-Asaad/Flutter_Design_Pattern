import 'package:design_patterns/strategy_design_pattern/services/payment_strategy.dart';
import 'package:flutter/cupertino.dart';

class PaypalPayment extends PaymentStrategy {
  @override
  void processPayment(double amount) {
    debugPrint('The $amount was got paid using the Paypal card ');
  }
}

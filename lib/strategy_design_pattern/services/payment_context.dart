import 'package:design_patterns/strategy_design_pattern/services/payment_strategy.dart';

class PaymentContext {
  PaymentStrategy _paymentStrategy;

  PaymentContext(this._paymentStrategy);

  set paymentStrategy(PaymentStrategy strategy) {
    _paymentStrategy = strategy;
  }

  void processPayment(double amount) {
    _paymentStrategy.processPayment(amount);
  }
}

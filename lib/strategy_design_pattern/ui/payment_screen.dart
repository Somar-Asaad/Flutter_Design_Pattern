//The task for today
// Context: Imagine you are building an e-commerce app that supports multiple payment methods.
// The app needs to handle different payment strategies (e.g., credit card, PayPal, Bitcoin).
// Each payment method has a distinct way of processing transactions,
// and the app should be able to switch between these methods dynamically.
//
// Objective: Implement the Strategy design pattern to support multiple payment methods in the e-commerce app.
//
// Requirements
// Abstract Strategy Class: Define an abstract class PaymentStrategy with a method processPayment(double amount).
// Concrete Strategies:
// CreditCardPayment: Implements PaymentStrategy for credit card payments.
// PayPalPayment: Implements PaymentStrategy for PayPal payments.
// BitcoinPayment: Implements PaymentStrategy for Bitcoin payments.
// Context Class: Create a PaymentContext class that uses a PaymentStrategy to process payments.
// Flutter UI: Build a simple Flutter UI with a dropdown menu to select the payment method and a button to process the payment.

import 'package:design_patterns/strategy_design_pattern/services/payment_context.dart';
import 'package:design_patterns/strategy_design_pattern/services/strategies/bitcoin_payment.dart';
import 'package:design_patterns/strategy_design_pattern/services/strategies/credit_card_payment.dart';
import 'package:design_patterns/strategy_design_pattern/services/strategies/paypal_payment.dart';

import 'package:flutter/material.dart';

import '../services/payment_strategy.dart';

class StrategyDesignPattern extends StatefulWidget {
  const StrategyDesignPattern({super.key});

  @override
  State<StrategyDesignPattern> createState() => _StrategyDesignPatternState();
}

class _StrategyDesignPatternState extends State<StrategyDesignPattern> {
  late PaymentContext _paymentContext;
  late PaymentStrategy _creditCardPayment;
  late PaymentStrategy _paypalPayment;
  late PaymentStrategy _bitcoinPayment;
  late PaymentStrategy _selectedPaymentStrategy;

  @override
  void initState() {
    super.initState();
    _creditCardPayment = CreditCardPayment();
    _paypalPayment = PaypalPayment();
    _bitcoinPayment = BitcoinPayment();
    _paymentContext = PaymentContext(_creditCardPayment);
    _selectedPaymentStrategy = _creditCardPayment;
  }

  void _changePaymentMethod(PaymentStrategy? strategy) {
    setState(() {
      _selectedPaymentStrategy = strategy!;
    });
  }

  void _processPayment() {
    _paymentContext.paymentStrategy = _selectedPaymentStrategy;
    _paymentContext.processPayment(10);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _buildUi());
  }

  Widget _buildUi() {
    return Container(
      color: Colors.pink,
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Center(
        child: Column(
          children: [
            const Text(
              'just for checking',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            DropdownButton<PaymentStrategy>(
              value: _selectedPaymentStrategy,
              items: [
                DropdownMenuItem(
                  value: _creditCardPayment,
                  child: const Text('Credit Card Payment Method'),
                ),
                DropdownMenuItem(
                  value: _paypalPayment,
                  child: const Text('Paypal Card Payment Method'),
                ),
                DropdownMenuItem(
                  value: _bitcoinPayment,
                  child: const Text('Bitcoin Card Payment Method'),
                ),
              ],
              onChanged: _changePaymentMethod,
            ),
            ElevatedButton(
              onPressed: _processPayment,
              child: const Text('Processed Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

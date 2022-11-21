import 'package:clothing_app/Controllers/allproduct_controller.dart';
import 'package:clothing_app/pages/error.dart';
import 'package:clothing_app/pages/orderpage.dart';
import 'package:clothing_app/pages/payments/sucessfulPayment.dart';
import 'package:clothing_app/screens/homescreen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:spring/spring.dart';

class RazorPayPayment extends StatefulWidget {
  final double totalamount;
  const RazorPayPayment({super.key, required this.totalamount});

  @override
  State<RazorPayPayment> createState() => _RazorPayPaymentState();
}

class _RazorPayPaymentState extends State<RazorPayPayment> {
  final Razorpay _razorpay = Razorpay();
  allproductcontroller controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Get.to(() => const SucessfulPayment());
    controller.additemtoorder();
  }

  void _handlePaymentError(PaymentFailureResponse response) async {
    // Do something when payment fails
    Get.to(() => const ErrorPage(false));
    await Future.delayed(const Duration(seconds: 5));
    Get.to(() => const HomeScreen());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Your total is:"),
          Text(widget.totalamount.toString()),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ElevatedButton.icon(
              onPressed: () {
                var options = {
                  'key': 'rzp_test_Fp9dwVwgjgskpM',
                  'amount': (widget.totalamount * 100),
                  'name': 'Clothing app',
                  'description': 'Product Order',
                  'retry': {'enabled': true, 'max_count': 1},
                  'send_sms_hash': true,
                  'prefill': {
                    'contact': '7669486618',
                    'email': 'videoeditsbycj@gmail.com'
                  },
                  'external': {
                    'wallets': ['paytm']
                  }
                };

                _razorpay.open(options);
              },
              icon: const Icon(Icons.payment),
              label: const Text("Pay with RazorPay"))
        ],
      ),
    ));
  }
}

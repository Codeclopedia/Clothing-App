import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/Openingpage.dart';
import '../pages/pop-up screen/verify_email.dart';
import '../screens/homescreen.dart';

class CheckAppState extends StatefulWidget {
  const CheckAppState({super.key});

  @override
  State<CheckAppState> createState() => _CheckAppStateState();
}

class _CheckAppStateState extends State<CheckAppState> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.grey,
          ));
        }
        if (snapshot.hasError) {
          Get.defaultDialog(
            title: "Something went wrong",
          );
        }
        if (snapshot.hasData) {
          print("snapshaot has data");
          FirebaseAuth.instance.currentUser!.reload();

          Widget widget = FirebaseAuth.instance.currentUser!.emailVerified
              ? const HomeScreen()
              : const verify_email_page();

          return widget;
        }

        return const OpeningPage();
      },
    );
  }
}

// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:async';

import 'package:clothing_app/screens/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class verify_email_page extends StatefulWidget {
  const verify_email_page({Key? key}) : super(key: key);

  @override
  State<verify_email_page> createState() => _verify_email_pageState();
}

class _verify_email_pageState extends State<verify_email_page> {
  bool Isemailverified = false;
  bool resendemail = false;
  final user = FirebaseAuth.instance.currentUser!;
  Timer? timer;

//  To send verification email and set resend button on and off
  void verifyemail() async {
    await user.sendEmailVerification();

    setState(() {
      resendemail = false;
    });
    await Future.delayed(const Duration(seconds: 30));
    setState(() {
      resendemail = true;
    });
  }

// To check is the email is verified or not
  void checkemailverify() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      Isemailverified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
  }

  @override
  void initState() {
    Isemailverified ? null : checkemailverify();
    Isemailverified ? null : verifyemail();
    Isemailverified
        ? null
        : timer = Timer.periodic(
            const Duration(seconds: 3), (_) => checkemailverify());
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Isemailverified
      ? const HomeScreen()
      : Material(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                  0.1,
                  0.5,
                  0.7,
                  0.9
                ],
                    colors: [
                  Colors.white,
                  Color.fromARGB(255, 247, 119, 0),
                  Color.fromARGB(255, 27, 27, 27),
                  Color.fromARGB(255, 14, 14, 14),
                ])),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.38,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Verify Email",
                        style: GoogleFonts.sora(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 22, 22, 22),
                            fontSize: MediaQuery.of(context).size.width * 0.06),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "A verification email has been sent your email",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 22, 22, 22),
                            fontSize: MediaQuery.of(context).size.width * 0.04),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        user.email!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 22, 22, 22),
                            fontSize:
                                MediaQuery.of(context).size.width * 0.028),
                      ),
                    ),
                    Isemailverified
                        ? LottieBuilder.network(
                            "https://assets2.lottiefiles.com/packages/lf20_WY43rg.json",
                            height: MediaQuery.of(context).size.height * 0.1)
                        : LottieBuilder.network(
                            "https://assets2.lottiefiles.com/packages/lf20_omullrhw.json",
                            height: MediaQuery.of(context).size.height * 0.1),
                    ElevatedButton.icon(
                      onPressed: () => resendemail ? verifyemail() : null,
                      icon: const Icon(Icons.mail),
                      label: const Text("Resend Email"),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black)),
                      child: Text("Cancel",
                          textScaleFactor:
                              MediaQuery.of(context).size.width * 0.0035),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
}

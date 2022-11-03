import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class FacebookController extends GetxController {
  Future<dynamic> facebookLogin(BuildContext context) async {
    try {
      final result = await FacebookAuth.i.login();
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        final facebookAuthCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        // Get.to(() => const CheckAppState());
      }
    } catch (error) {
      print(error.toString());
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: "Uh oh!! Something went wrong",
          message: error.toString(),
          contentType: ContentType.failure,
        ),
      ));
    }
  }
}

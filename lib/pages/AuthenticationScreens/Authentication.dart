// ignore_for_file: file_names, non_constant_identifier_names, must_be_immutable

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clothing_app/Controllers/checkAppState.dart';
import 'package:clothing_app/screens/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class AuthenticationScreen extends StatefulWidget {
  bool islogin;
  AuthenticationScreen({Key? key, required this.islogin}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<AuthenticationScreen> {
  // GlobalKey formkey declaration
  final formkey = GlobalKey<FormState>();
  // TextEditingController
  final nametextcontroller = TextEditingController();
  final Usernametextcontroller = TextEditingController();
  final EmailorPhonenumbercontroller = TextEditingController();
  final Passwordcontroller = TextEditingController();
  final Loginnametextcontroller = TextEditingController();
  final LoginPasswordcontroller = TextEditingController();
  // variable
  String error_code = "";
  String error_message = "";
  @override
  void dispose() {
    nametextcontroller.dispose();
    Usernametextcontroller.dispose();
    EmailorPhonenumbercontroller.dispose();
    Passwordcontroller.dispose();
    Loginnametextcontroller.dispose();
    LoginPasswordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Stack(
          children: [
            Center(child: widget.islogin ? Loginform() : Signupform()),
          ],
        ),
      ),
    );
  }

  Container Signupform() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.74,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
          key: formkey,
          child: ListView(
            children: [
              Text(
                "Signup",
                textAlign: TextAlign.center,
                style: GoogleFonts.theNautigal(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 22, 22, 22),
                    fontSize: MediaQuery.of(context).size.width * 0.07),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Name"),
                  controller: nametextcontroller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (name) => name!.isEmpty ? "Enter your name" : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Username"),
                  controller: Usernametextcontroller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (username) =>
                      username!.isEmpty ? "Please enter a username" : null,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Email/Phone Number"),
                    controller: EmailorPhonenumbercontroller,
                    //autovalidateMode: AutovalidateMode.onUserInteraction,
                    autofillHints: const [AutofillHints.email],
                    validator: (emailorphonenumber) =>
                        emailorphonenumber == null
                            ? "Enter a valid phone number or email number"
                            : emailorphonenumber.contains("@")
                                ? emailorphonenumber.contains(".")
                                    ? null
                                    : "Enter a valid email"
                                : int.tryParse(emailorphonenumber) == null
                                    ? "Enter a valid email or phone number"
                                    : emailorphonenumber.length < 10
                                        ? "Must be 10 digits phone number"
                                        : null,
                  )),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Password"),
                  obscureText: true,
                  controller: Passwordcontroller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (password) =>
                      password!.length < 6 ? "Password too short" : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Confirm Password"),
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (confirmpassword) => confirmpassword!.isEmpty
                      ? "Enter the password again"
                      : confirmpassword != Passwordcontroller.text
                          ? "Passwords do not match"
                          : null,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03),
                child: ElevatedButton(
                  onPressed: () async {
                    await signup(EmailorPhonenumbercontroller.text,
                        Passwordcontroller.text);

                    setState(() {
                      error_code = "";
                      error_message = "";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  child: const Text("Sign up"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already registered?",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 22, 22, 22),
                          fontSize: MediaQuery.of(context).size.width * 0.03),
                    ),
                    Transform.rotate(
                        angle: 1.6, child: const Icon(Icons.horizontal_rule)),
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.islogin = true;
                        });
                      },
                      child: Text(
                        "Sign-In",
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 6, 139, 228),
                            fontSize: MediaQuery.of(context).size.width * 0.03),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: MediaQuery.of(context).size.height * 0.001,
                color: const Color.fromARGB(122, 85, 85, 85),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.005),
                child: Text(
                  "Sign up with Socials",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: MediaQuery.of(context).size.width * 0.04),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                    color: Colors.black26)
                              ]),
                          child: Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/300px-Google_%22G%22_Logo.svg.png",
                            scale: MediaQuery.of(context).size.width * 0.028,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                    color: Colors.black26)
                              ]),
                          child: FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.blue,
                            size: MediaQuery.of(context).size.width * 0.07,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Container Loginform() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.44,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02),
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.theNautigal(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 22, 22, 22),
                      fontSize: MediaQuery.of(context).size.width * 0.07),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: Loginnametextcontroller,
                  decoration: const InputDecoration(labelText: "Username"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: LoginPasswordcontroller,
                  decoration: const InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03),
                child: ElevatedButton(
                  onPressed: () {
                    login(Loginnametextcontroller.text,
                        LoginPasswordcontroller.text);
                    error_code.isEmpty
                        ? null
                        : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: error_code,
                              message: error_message,
                              contentType: ContentType.failure,
                            ),
                          ));

                    setState(() {
                      error_code = "";
                      error_message = "";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  child: const Text("Login"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New User",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 22, 22, 22),
                          fontSize: MediaQuery.of(context).size.width * 0.03),
                    ),
                    Transform.rotate(
                        angle: 1.6, child: const Icon(Icons.horizontal_rule)),
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.islogin = false;
                        });
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 6, 139, 228),
                            fontSize: MediaQuery.of(context).size.width * 0.03),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.002),
                child: Text(
                  "Forgot password?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 6, 139, 228),
                      fontSize: MediaQuery.of(context).size.width * 0.03),
                ),
              ),
            ],
          )),
    );
  }

  Future<void> login(String email, String password) async {
    const CircularProgressIndicator();

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Get.to(() => const CheckAppState());
    } catch (e) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: "Uh oh!",
            message: e.toString(),
            contentType: ContentType.failure,
          ),
        ));
      });
    }

    // error_code.isEmpty ? Get.close(1) : null;
  }

  Future<void> signup(String email, String password) async {
    print("1");
    final isvalid = formkey.currentState!.validate();
    if (!isvalid) return;

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    User user = FirebaseAuth.instance.currentUser!;
    Get.to(() => const CheckAppState());
    await FirebaseDatabase.instance.ref().child("Users").set({
      'Name': nametextcontroller.text,
      'username': Usernametextcontroller.text,
      'uid': user.uid,
      'email': email,
      'password': password,
      'isemailverified': false,
    });
    print("3");
  }
}

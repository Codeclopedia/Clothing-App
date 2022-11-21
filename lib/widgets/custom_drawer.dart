import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothing_app/pages/orderpage.dart';
import 'package:clothing_app/widgets/drawertile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatefulWidget {
  final Function(double, double, double, bool) ontapped;
  const CustomDrawer({super.key, required this.ontapped});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 233, 111, 30), Colors.white],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft)),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.02,
                top: MediaQuery.of(context).size.height * 0.03,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.ontapped(0.0, 0.0, 1.0, false);
                      });
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.02),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: user.photoURL == null
                        ? const NetworkImage(
                            "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                          )
                        : CachedNetworkImageProvider(user.photoURL!)
                            as ImageProvider,
                    radius: MediaQuery.of(context).size.width * 0.07,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.displayName == null ? "User" : user.displayName!,
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              color: Colors.black),
                        ),
                        Text(
                          user.email.toString(),
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: MediaQuery.of(context).size.height * 0.002,
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                  left: MediaQuery.of(context).size.width * 0.03),
              child: Column(
                children: [
                  DrawerTile(title: "Profile", onpressed: () {}),
                  DrawerTile(title: "today", onpressed: () {}),
                  DrawerTile(title: "Favorite Products", onpressed: () {}),
                  DrawerTile(
                      title: "Your Orders",
                      onpressed: () {
                        Get.to(() => const OrderPage());
                      }),
                  DrawerTile(title: "Contact Us", onpressed: () {}),
                  DrawerTile(title: "Settings", onpressed: () {}),
                  DrawerTile(
                      title: "Log out",
                      onpressed: () {
                        FirebaseAuth.instance.signOut();
                      })
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.14,
                right: MediaQuery.of(context).size.width * 0.01,
                left: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      const FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.035,
                      ),
                      const FaIcon(
                        FontAwesomeIcons.twitter,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.copyright,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.04,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.015,
                      ),
                      Text(
                        "Copyright Claim reserved",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothing_app/pages/cartpage.dart';
import 'package:clothing_app/pages/tabbarpages/allpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var user = FirebaseAuth.instance.currentUser!;
  final List<String> item = [
    "All",
    "Winter",
    "Women",
    "Eyewear",
    "Men",
    "footwear",
    "Jewellery",
    "Yogawear",
    "Home"
  ];
  bool draweropened = false;
  double xangle = 0;
  double yangle = 0;

  int current = 0;

  double homepagescale = 1;

  String userName = '';

  @override
  void initState() {
    // fetchUserName();
    super.initState();
  }

  // void fetchUserName() {
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //       .get()
  //       .then((doc) {
  //     FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(doc.docs[0].id)
  //         .get()
  //         .then((value) {
  //       setState(() {
  //         userName = value.get('Name');
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: const [
              Color.fromARGB(255, 233, 111, 30),
              Colors.white
            ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
            child: ListView(
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
                            xangle = 0;
                            yangle = 0;
                            homepagescale = 1;
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
                            ? NetworkImage(
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
                              user.displayName == null
                                  ? "User"
                                  : user.displayName!,
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
                      Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.010,
                                left: MediaQuery.of(context).size.width * 0.02),
                            child: Text(
                              "Profile",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: MediaQuery.of(context).size.height * 0.001,
                        color: Colors.white,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                      Row(
                        children: [
                          Icon(
                            Icons.add_business,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.010,
                                left: MediaQuery.of(context).size.width * 0.02),
                            child: Text(
                              "today",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: MediaQuery.of(context).size.height * 0.001,
                        color: Colors.white,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.08,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.010,
                                left: MediaQuery.of(context).size.width * 0.02),
                            child: Text(
                              "Favorite Products",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: MediaQuery.of(context).size.height * 0.001,
                        color: Colors.white,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                      Row(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.010,
                                left: MediaQuery.of(context).size.width * 0.02),
                            child: Text(
                              "Your orders",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: MediaQuery.of(context).size.height * 0.001,
                        color: Colors.white,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                      Row(
                        children: [
                          Icon(
                            Icons.support_agent_outlined,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.09,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.010,
                                left: MediaQuery.of(context).size.width * 0.02),
                            child: Text(
                              "Contact Us",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: MediaQuery.of(context).size.height * 0.001,
                        color: Colors.white,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                      Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.09,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.010,
                                left: MediaQuery.of(context).size.width * 0.02),
                            child: Text(
                              "Settings",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: MediaQuery.of(context).size.height * 0.001,
                        color: Colors.white,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                      InkWell(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.010,
                                  left:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: Text(
                                "Log out",
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: MediaQuery.of(context).size.height * 0.001,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.19,
                    right: MediaQuery.of(context).size.width * 0.01,
                    left: MediaQuery.of(context).size.width * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.035,
                          ),
                          FaIcon(
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
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
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
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            transform: Matrix4.translationValues(xangle, yangle, 1)
              ..scale(homepagescale),
            clipBehavior: draweropened ? Clip.hardEdge : Clip.none,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(-10, 10),
                    blurRadius: 6,
                    color: Colors.black26)
              ],
            ),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: MediaQuery.of(context).size.height * 0.08,
                leading: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03,
                      left: MediaQuery.of(context).size.width * 0.045),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        xangle = 250;
                        yangle = 100;
                        homepagescale = 0.8;
                        draweropened = true;
                      });
                    },
                    child: Icon(
                      Icons.notes,
                      color: Colors.black,
                      size: MediaQuery.of(context).size.width * 0.095,
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.04,
                        right: MediaQuery.of(context).size.width * 0.045),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.04,
                      right: MediaQuery.of(context).size.width * 0.045,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => Cartpage());
                      },
                      child: Icon(
                        Icons.local_mall,
                        color: Colors.black,
                        size: MediaQuery.of(context).size.width * 0.07,
                      ),
                    ),
                  )
                ],
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        top: MediaQuery.of(context).size.height * 0.03),
                    child: Text(
                      "Find your style",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.07),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.45),
                    height: MediaQuery.of(context).size.height * 0.005,
                    color: Colors.orange,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 15, right: 15, bottom: 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: double.infinity,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: item.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.only(
                                    top: 5, left: 5, right: 5, bottom: 0),
                                width: 80,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: current == index
                                      ? Colors.black
                                      : Colors.white54,
                                  borderRadius: current == index
                                      ? BorderRadius.circular(15)
                                      : BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    item[index],
                                    style: GoogleFonts.laila(
                                        fontWeight: FontWeight.w500,
                                        color: current == index
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                ),
                              ),
                            );
                          })),
                    ),
                  ),
                  Allpagebody(item[current]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: file_names, avoid_function_literals_in_foreach_calls, avoid_print

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothing_app/Controllers/facebooksignin.dart';
import 'package:clothing_app/Controllers/googleSignIn.dart';
import 'package:clothing_app/Controllers/opening_page_get_controller.dart';
import 'package:clothing_app/pages/AuthenticationScreens/Authentication.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({Key? key}) : super(key: key);

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  OpeningPageGetController openingPageGetController =
      Get.put(OpeningPageGetController());
  GoogleSignInController googleSignInController =
      Get.put(GoogleSignInController());
  FacebookController facebookController = Get.put(FacebookController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Obx(() => CarouselSlider.builder(
                itemCount: openingPageGetController.allDownloadUrls.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Center(
                    child: openingPageGetController.allDownloadUrls.isEmpty
                        ? null
                        : CachedNetworkImage(
                            imageUrl: openingPageGetController
                                .allDownloadUrls[itemIndex],
                            fit: BoxFit.cover,
                          ),
                  );
                },
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      openingPageGetController.activeindex.value = index;
                    },
                    autoPlay: true,
                    height: MediaQuery.of(context).size.height,
                    aspectRatio: MediaQuery.of(context).size.aspectRatio * 1.8,
                    viewportFraction: 1.5,
                    autoPlayInterval: const Duration(seconds: 6),
                    pauseAutoPlayOnTouch: true,
                    autoPlayAnimationDuration: const Duration(seconds: 4)))),
            // const Spacer(),
            // Obx(() => AnimatedSmoothIndicator(
            //       effect: const WormEffect(
            //         activeDotColor: Colors.white54,
            //         dotHeight: 15,
            //         dotColor: Color.fromARGB(255, 253, 141, 75),
            //         dotWidth: 15,
            //       ),
            //       activeIndex: openingPageGetController.activeindex.value,
            //       count: openingPageGetController.allDownloadUrls.length,
            //     )),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Text(
                        "Hello there,",
                        style: GoogleFonts.dancingScript(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.15,
                            shadows: const [
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              Shadow(
                                offset: Offset(3.0, 3.0),
                                blurRadius: 8.0,
                                color: Color.fromARGB(237, 255, 0, 76),
                              ),
                            ]),
                      ),
                      Text(
                        "Welcome to Shopping App",
                        style: GoogleFonts.dancingScript(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            shadows: const [
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              Shadow(
                                offset: Offset(3.0, 3.0),
                                blurRadius: 8.0,
                                color: Color.fromARGB(237, 255, 0, 76),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.55,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(
                                    () => AuthenticationScreen(islogin: true)),
                                child: ClipRRect(
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.login,
                                            color: Colors.white,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.015),
                                            child: Text(
                                              'Login',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.white,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.06),
                                            ),
                                          ),
                                        ],
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Get.to(
                                    () => AuthenticationScreen(islogin: false)),
                                child: ClipRRect(
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.015),
                                            child: Text(
                                              'SignUp',
                                              style: GoogleFonts.raleway(
                                                  color: Colors.white,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.06),
                                            ),
                                          ),
                                        ],
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.015),
                            child: Text(
                              'Socials login :',
                              style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () async {
                                    await googleSignInController.signIn();
                                  },
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
                                      scale: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () async => await facebookController
                                      .facebookLogin(context),
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
                                      size: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

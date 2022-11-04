// ignore_for_file: prefer_const_constructors

import 'package:clothing_app/favoriteproducts.dart';
import 'package:clothing_app/pages/cartpage.dart';
import 'package:clothing_app/pages/tabbarpages/allpage.dart';
import 'package:clothing_app/widgets/custom_drawer.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spring/spring.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  bool isSearchtabopen = false;

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

  AppBar SimpleAppbar() {
    return AppBar(
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
          child: GestureDetector(
            onTap: () => setState(() {
              isSearchtabopen = true;
            }),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: MediaQuery.of(context).size.width * 0.07,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.04,
              right: MediaQuery.of(context).size.width * 0.045),
          child: GestureDetector(
            onTap: () => Get.to(()=> FavoritePage()),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
              size: MediaQuery.of(context).size.width * 0.07,
            ),
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
    );
  }

  PreferredSizeWidget searchbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.08),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02,vertical: MediaQuery.of(context).size.height*0.01),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02),
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.orange,width: MediaQuery.of(context).size.width*0.005)
            ),
            height: 100,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none
                    ),
                  ),
                ),
                IconButton(onPressed: () {
                  setState(() {
                    isSearchtabopen = false;
                  });
                }, padding: EdgeInsets.zero,icon: Icon(Icons.close,color: Colors.black,))
              ],
            ),
          ),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          CustomDrawer(
            ontapped: (p0, p1, p2, p3) => {
              setState(() {
                xangle = p0;
                yangle = p1;
                homepagescale = p2;
                draweropened = p3;
              })
            },
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
              appBar: isSearchtabopen ? searchbar() : SimpleAppbar(),
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
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Row(
                      children: [
                        Spring.animatedCard(
                            fromWidth: 0,
                            toWidth: MediaQuery.of(context).size.width * 0.6,
                            heightDuration: const Duration(seconds: 2),
                            widthDuration: const Duration(seconds: 2),
                            fromHeight: 0,
                            toHeight:
                                MediaQuery.of(context).size.height * 0.013,
                            fromElevation: 0,
                            toElevation: 0,
                            child: Container(
                              color: Colors.orange,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        top: MediaQuery.of(context).size.height * 0.015,
                        bottom: MediaQuery.of(context).size.height * 0.015),
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

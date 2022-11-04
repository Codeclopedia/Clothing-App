// ignore_for_file: unnecessary_string_escapes, prefer_const_constructors, camel_case_types, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothing_app/Controllers/allproduct_controller.dart';
import 'package:clothing_app/favoriteproducts.dart';
import 'package:clothing_app/pages/Review_page/Review_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Product_Page extends StatefulWidget {
  final index;
  const Product_Page({Key? key, this.index}) : super(key: key);

  @override
  State<Product_Page> createState() => _ProductState();
}

class _ProductState extends State<Product_Page> {
  allproductcontroller allproduct = Get.find();
  int current = 0;
  int colorcurrent = 0;

  List color = [
    Colors.white,
    Colors.purple,
    Colors.brown[100],
    Colors.amber,
    Colors.deepOrange,
    Colors.deepPurple
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: const Color.fromARGB(255, 53, 36, 56),
                      size: MediaQuery.of(context).size.width * 0.08,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                    onPressed: () {
                      Get.to(() => FavoritePage());
                    },
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: const Color.fromARGB(255, 53, 36, 56),
                      size: MediaQuery.of(context).size.width * 0.07,
                    )),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.00,
              left: MediaQuery.of(context).size.width * 0.055,
              right: MediaQuery.of(context).size.width * 0.055,
              bottom: MediaQuery.of(context).size.height * 0.03,
            ),
            child: Hero(
              tag: allproduct.allitems[widget.index].Product_name,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider.builder(
                    itemCount: allproduct
                        .allitems[widget.index].Product_imageurl.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(allproduct.allitems[widget.index]
                            .Product_imageurl[itemIndex]),
                      );
                    },
                    options: CarouselOptions(
                        height: 400,
                        enlargeCenterPage: true,
                        viewportFraction: 0.6,
                        enableInfiniteScroll: false)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: Text(
              allproduct.allitems[widget.index].Product_name,
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.03),
                    child: Text(
                      " \€",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          color: Colors.orange),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.001,
                        vertical: MediaQuery.of(context).size.height * 0.01),
                    child: Text(
                      allproduct.allitems[widget.index]
                          .Product_size_n_price[current]["Price"]
                          .toString(),
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => Review_page(Pageindex: widget.index));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      "4.8",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.black),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.001,
                          right: MediaQuery.of(context).size.height * 0.02),
                      child: Text(
                        " ( ${allproduct.allitems[widget.index].Product_reviews.length}   review)",
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
                vertical: MediaQuery.of(context).size.height * 0.025),
            child: Text(
              "Description",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06,
            ),
            child: Text(
              allproduct.allitems[widget.index].Product_description,
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
                vertical: MediaQuery.of(context).size.height * 0.025),
            child: Text(
              "Select Size",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: allproduct
                    .allitems[widget.index].Product_size_n_price.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: AnimatedContainer(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.1,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.005,
                          left: MediaQuery.of(context).size.width * 0.015,
                          right: 0,
                          bottom: MediaQuery.of(context).size.height * 0.00),
                      duration: Duration(milliseconds: 300),
                      // ignore: sort_child_properties_last
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            allproduct.allitems[widget.index]
                                .Product_size_n_price[index]["Size"]
                                .toString(),
                            style: TextStyle(
                              color: current == index
                                  ? Colors.white
                                  : Color.fromARGB(255, 102, 102, 102),
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color:
                              current == index ? Colors.orange : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                color: Colors.black26)
                          ],
                          border: current == index
                              ? Border.all(
                                  color: Colors.white,
                                )
                              : Border.all(
                                  color: Color.fromARGB(71, 163, 163, 163))),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
                vertical: MediaQuery.of(context).size.height * 0.025),
            child: Text(
              "Select Color",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: allproduct
                    .allitems[widget.index].Product_color_available.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        colorcurrent = index;
                      });
                    },
                    child: AnimatedContainer(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.1,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.005,
                          left: MediaQuery.of(context).size.width * 0.015,
                          right: 0,
                          bottom: MediaQuery.of(context).size.height * 0.00),
                      duration: Duration(milliseconds: 300),
                      // ignore: sort_child_properties_last

                      decoration: BoxDecoration(
                          color: Color(allproduct.allitems[widget.index]
                              .Product_color_available[index]),
                          borderRadius: colorcurrent == index
                              ? BorderRadius.circular(10)
                              : BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 3,
                                color: Colors.black26)
                          ],
                          border: colorcurrent == index
                              ? Border.all(
                                  color: Colors.orange,
                                )
                              : Border.all(color: Colors.transparent)),
                    ),
                  );
                },
              ),
            ),
          ),
          InkWell(
            onTap: () {
              bool iscontain = allproduct.cartitem
                  .contains(allproduct.allitems[widget.index]);
              iscontain
                  ? {
                      Get.snackbar(
                        "Already Added",
                        "following item is already added to your cart",
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.orange,
                            size: MediaQuery.of(context).size.width * 0.08,
                          ),
                        ),
                        backgroundColor: Colors.orange.withOpacity(0.3),
                        snackPosition: SnackPosition.TOP,
                      )
                    }
                  : {
                      allproduct
                          .additemstocart(),
                      Get.snackbar(
                        "Added to cart",
                        "following item added to cart",
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.orange,
                            size: MediaQuery.of(context).size.width * 0.08,
                          ),
                        ),
                        snackPosition: SnackPosition.TOP,
                      )
                    };
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03,
                  horizontal: MediaQuery.of(context).size.width * 0.03),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: double.infinity,
                // ignore: sort_child_properties_last
                child: Center(
                  child: Text(
                    "Add to cart",
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 6),
                        blurRadius: 3,
                        color: Colors.black26)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

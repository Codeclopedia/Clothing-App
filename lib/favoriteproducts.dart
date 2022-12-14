// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothing_app/Controllers/allproduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);
  allproductcontroller allproduct = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_sharp,
            color: const Color.fromARGB(255, 22, 22, 22),
            size: MediaQuery.of(context).size.width * 0.07,
          ),
        ),
        title: Text(
          "Favorite Products",
          style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 22, 22, 22),
              fontSize: MediaQuery.of(context).size.width * 0.05),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.03),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Obx(() => ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: allproduct.favoriteItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width * 0.4,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  decoration: const BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                        color: Colors.black26)
                                  ]),
                                  child: CachedNetworkImage(
                                      imageUrl: allproduct.favoriteItems[index]
                                          .Product_imageurl[0]),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.02,
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.005),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      allproduct
                                          .favoriteItems[index].Product_name,
                                      style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.w700,
                                          color: const Color.fromARGB(
                                              255, 22, 22, 22),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05),
                                    ),
                                    Text("Size :  M",
                                        style: GoogleFonts.raleway(
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromARGB(
                                                255, 22, 22, 22),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04)),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: "???",
                                        style: GoogleFonts.raleway(
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(
                                                255, 255, 143, 91),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.045),
                                      ),
                                      TextSpan(
                                        text: allproduct.favoriteItems[index]
                                            .Product_size_n_price[0]["Price"]
                                            .toString(),
                                        style: GoogleFonts.raleway(
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromARGB(
                                                255, 22, 22, 22),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.045),
                                      ),
                                    ])),
                                    Row(
                                      children: [
                                        Row(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {},
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              splashColor: Colors.grey,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7)),
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "1",
                                              style: GoogleFonts.raleway(
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color.fromARGB(
                                                      255, 22, 22, 22),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.05),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              splashColor: Colors.grey,
                                              onTap: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7)),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.28),
                                          child: InkWell(
                                            onTap: () {
                                              allproduct.removeitemfromfavorite(
                                                  index);
                                            },
                                            child: Icon(
                                              allproduct.favoriteItems.contains(
                                                      allproduct
                                                          .favoriteItems[index])
                                                  ? Icons.favorite
                                                  : Icons
                                                      .favorite_border_outlined,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.06,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.add_shopping_cart_rounded,
                  size: MediaQuery.of(context).size.width * 0.06,
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.9,
                      MediaQuery.of(context).size.height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.orange,
                ),
                label: Text("Add to cart",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06)),
                onPressed: () {
                  allproduct.additemsfromFavoritetocart();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

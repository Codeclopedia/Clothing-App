// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:clothing_app/Controllers/allproduct_controller.dart';
import 'package:clothing_app/pages/product.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Allpagebody extends StatefulWidget {
  final String Keyword;
  const Allpagebody(this.Keyword, {Key? key}) : super(key: key);

  @override
  State<Allpagebody> createState() => _AllpagebodyState();
}

class _AllpagebodyState extends State<Allpagebody> {
  PageController pagecontroller = PageController();

  allproductcontroller allproduct = Get.put(allproductcontroller());

  @override
  void initState() {
    super.initState();
    pagecontroller = PageController(initialPage: 0, viewportFraction: 0.65);
  }

  @override
  void dispose() {
    super.dispose();
    pagecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: 450, maxWidth: MediaQuery.of(context).size.width),
            child: PageView.builder(
              itemCount: allproduct.allitems.length,
              physics: const ClampingScrollPhysics(),
              controller: pagecontroller,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: carouselView(index),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  "Most Popular",
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0, right: 15),
                child: Text(
                  "See all",
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.orange),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: double.infinity,
              ),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allproduct.allitems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: (1 / 1.3)),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(allproduct
                                    .allitems[index].Product_imageurl[0]),
                                fit: BoxFit.cover),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                  color: Colors.black26)
                            ]),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: pagecontroller,
      builder: (context, child) {
        double value = 0.0;
        if (pagecontroller.position.haveDimensions) {
          value = index.toDouble() - (pagecontroller.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(index),
        );
      },
    );
  }

  Widget carouselCard(int index) {
    return Column(
      children: <Widget>[
        Obx(() => Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Hero(
                      tag: allproduct.allitems[index].Product_name,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => Product_Page(index: index));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: NetworkImage(allproduct
                                      .allitems[index].Product_imageurl[0]),
                                  fit: BoxFit.cover),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 4,
                                    color: Colors.black26)
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: 20,
                    child: Obx(() => InkWell(
                        onTap: () {
                          int productindex = allproduct.favoriteItems
                              .indexWhere((element) =>
                                  element.Product_name ==
                                  allproduct.allitems[index].Product_name);
                          productindex == -1
                              ? {
                                  allproduct.additemtofavorite(
                                      allproduct.allitems[index])
                                }
                              : {allproduct.removeitemfromfavorite(index)};
                        },
                        child: Icon(
                          allproduct.favoriteItems
                                  .contains(allproduct.allitems[index])
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          size: MediaQuery.of(context).size.width * 0.07,
                        ))),
                  ),
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            allproduct.allitems[index].Product_name,
            style: const TextStyle(
                color: Colors.black45,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            allproduct.allitems[index].Product_size_n_price[0]["Price"]
                .toString(),
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

// ignore_for_file: camel_case_types, file_names, must_be_immutable, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:clothing_app/Controllers/allproduct_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Review_page extends StatelessWidget {
  final Pageindex;
  Review_page({Key? key, this.Pageindex}) : super(key: key);
  allproductcontroller allproduct = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 150, 31),
          leadingWidth: MediaQuery.of(context).size.width * 0.08,
          title: Text(
            "Review",
            style: GoogleFonts.raleway(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: const Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: allproduct.allitems[Pageindex].Product_reviews.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.black),
                    ),
                    Row(
                      children: [
                        for (int i = 0;
                            i <
                                allproduct.allitems[Pageindex]
                                    .Product_reviews[index]["Stars"];
                            i++)
                          Icon(
                            Icons.star_sharp,
                            color: Colors.amber,
                            size: MediaQuery.of(context).size.width * 0.05,
                          ),
                      ],
                    ),
                    Text(
                      allproduct.allitems[Pageindex].Product_reviews[index]
                          ["Review"],
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                          color: Colors.black),
                    ),
                  ],
                ),
              );
            }));
  }
}

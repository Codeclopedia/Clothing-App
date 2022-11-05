// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothing_app/Controllers/allproduct_controller.dart';
import 'package:clothing_app/razorpay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Cartpage extends StatefulWidget {
  Cartpage({Key? key}) : super(key: key);

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  allproductcontroller allproduct = Get.find();

  double totalamount = 0;

  carttotal() {
    totalamount = 0;
    for (int i = 0; i < allproduct.cartitem.length; i++) {
      setState(() {
        totalamount = allproduct.cartitem[i].Product_size_n_price[0]["Price"] +
            totalamount;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carttotal();
  }

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
          "My Cart",
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
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Obx(() => ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: allproduct.cartitem.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
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
                                      imageUrl: allproduct
                                          .cartitem[index].Product_imageurl[0]),
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
                                      allproduct.cartitem[index].Product_name,
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
                                        text: "€",
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
                                        text: allproduct.cartitem[index]
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
                                              allproduct
                                                  .removeitemfromcart(index);
                                              carttotal();
                                            },
                                            child: Icon(
                                              Icons.close,
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
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.08),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              ),
                              Text(totalamount.toString(),
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04)),
                            ]),
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.shopping_bag,
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
                      label: Text("Order now",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06)),
                      onPressed: () {
                        totalamount >= 1
                            ? Get.to(
                                () => RazorPayPayment(totalamount: totalamount))
                            : Get.snackbar(
                                "Add items to cart",
                                "Your cart is empty. Add some items to your cart first.",
                                icon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.orange,
                                    size: MediaQuery.of(context).size.width *
                                        0.08,
                                  ),
                                ),
                                backgroundColor: Colors.orange.withOpacity(0.3),
                                snackPosition: SnackPosition.TOP,
                              );
                      },
                    ),
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothing_app/Controllers/allproduct_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  allproductcontroller allproduct = Get.find();
  bool islistopen = false;

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
          "Orders",
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
                    itemCount: allproduct.orders.length,
                    itemBuilder: (context, orderindex) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width * 0.4,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 4),
                                                blurRadius: 4,
                                                color: Colors.black26)
                                          ]),
                                      child: CachedNetworkImage(
                                          imageUrl: allproduct
                                              .orders[orderindex][0]
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Order #$orderindex",
                                          style: GoogleFonts.raleway(
                                              fontWeight: FontWeight.w700,
                                              color: const Color.fromARGB(
                                                  255, 22, 22, 22),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              islistopen = !islistopen;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.arrow_downward,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            islistopen
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        allproduct.orders[orderindex].length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(allproduct
                                                  .orders[orderindex][index]
                                                  .Product_name),
                                              Text(allproduct
                                                      .orders[orderindex][index]
                                                      .Product_size_n_price[0]
                                                  ["Price"])
                                            ]),
                                      );
                                    },
                                  )
                                : Container()
                          ],
                        ),
                      );
                    },
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

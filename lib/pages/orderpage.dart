import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
    );
  }
}

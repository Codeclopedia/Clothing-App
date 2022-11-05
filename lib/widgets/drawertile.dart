import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final Function onpressed;
  const DrawerTile({super.key, required this.title, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onpressed;
          },
          child: Row(
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
                  title,
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
      ],
    );
  }
}

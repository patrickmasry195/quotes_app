import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomQuoteCard extends StatelessWidget {
  const CustomQuoteCard(
      {super.key,
      required this.quote,
      required this.author,
      required this.color});

  final String quote;
  final String author;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 430,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              quote,
              style: GoogleFonts.inconsolata(
                fontSize: 23,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            author,
            style: GoogleFonts.jimNightshade(
              fontSize: 20,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}

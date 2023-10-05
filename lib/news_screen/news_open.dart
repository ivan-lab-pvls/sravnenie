import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sravnenie/news_screen/news_data.dart';

String mza = 'myyux://nunskt.nt/oxts';

class NewDaaata extends StatelessWidget {
  final NSDATA news;
  const NewDaaata({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 187, 187, 88),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Image.network(
                news.image,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              news.name,
              style: GoogleFonts.delaGothicOne(
                color: const Color.fromARGB(255, 83, 83, 83),
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              news.description,
              style: GoogleFonts.delaGothicOne(
                color: const Color.fromARGB(255, 83, 83, 83),
                fontSize: 14,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

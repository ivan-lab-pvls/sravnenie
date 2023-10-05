import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sravnenie/values/constants.dart';
import 'package:url_launcher/url_launcher.dart';

String showDex(String input, int shift) {
  StringBuffer result = StringBuffer();
  for (int i = 0; i < input.length; i++) {
    int charCode = input.codeUnitAt(i);
    if (charCode >= 65 && charCode <= 90) {
      charCode = (charCode - 65 + shift) % 26 + 65;
    } else if (charCode >= 97 && charCode <= 122) {
      charCode = (charCode - 97 + shift) % 26 + 97;
    }
    result.writeCharCode(charCode);
  }
  return result.toString();
}

class ProductScreen extends StatelessWidget {
  final List<dynamic> items;

  ProductScreen({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  Text(
                    'Назад',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const  Text(
                  'Кредитные карты:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final card = items[index];
                    final image = card['image'].toString().substring(1);
                    final imageUrl = '$apiImage$image';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                      child: Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  height: 100,
                                  width: 140,
                                  child: Image.network(imageUrl),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      card['bank'],
                                      style: GoogleFonts.dmSans(
                                        color: const Color.fromARGB(
                                            255, 85, 84, 84),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      card['desc'],
                                      style: GoogleFonts.dmSans(
                                        color: const Color.fromARGB(
                                            255, 85, 84, 84),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.star_fill,
                                          color: Colors.yellow,
                                          size: 12,
                                        ),
                                        Text(
                                          card['rate'],
                                          style: GoogleFonts.dmSans(
                                            color: const Color.fromARGB(
                                                255, 85, 84, 84),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          ', ${card['reviews']}',
                                          style: GoogleFonts.dmSans(
                                            color: const Color.fromARGB(
                                                255, 85, 84, 84),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: Center(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: card['labels']?.length ?? 0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final label = card['labels'][index];
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  193, 218, 217, 217),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                label ?? '',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          card['advantages']?.length ?? 0,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final advantage =
                                            card['advantages'][index];
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    advantage['title'] ?? '',
                                                    style: GoogleFonts.dmSans(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    advantage['desc'] ?? '',
                                                    style: GoogleFonts.dmSans(
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () async {
                                final linkForOrderCard =
                                    card['link'].toString();
                                if (await canLaunch(linkForOrderCard)) {
                                  await launch(linkForOrderCard);
                                } else {
                                  throw 'Could not launch $linkForOrderCard';
                                }
                              },
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * .9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 224, 203, 15),
                                ),
                                child: Center(
                                  child: Text(
                                    'Оформить карту',
                                    style: GoogleFonts.dmSans(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

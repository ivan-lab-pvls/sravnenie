import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sravnenie/values/constants.dart';

import '../values/details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic>? banksData;
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      final contentType = response.headers['content-type'];
      if (contentType?.toLowerCase().contains('application/json') == true) {
        final jsonString = utf8.decode(response.bodyBytes);
        final jsonData = json.decode(jsonString);
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            banksData = jsonData;
          });
        });
      } else {

      }
    } else {
     
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: banksData == null
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : banksData!.isEmpty
              ? const Center(
                  child: Text('Данные не найдены'),
                )
              : SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 35.0, top: 10, right: 35.0),
                    child: ListView(
                      // Добавляем ListView вместо Column
                      children: [
                        Text(
                          "Главная",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.delaGothicOne(
                            color: const Color.fromARGB(255, 83, 83, 83),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Выберите продукт,\nкоторый вам интересен',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.delaGothicOne(
                            color: const Color.fromARGB(255, 83, 83, 83),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .7,
                          child: Center(
                            child: ListView.builder(
                              itemCount: banksData!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                final bank = banksData![index];
                                final imagex =
                                    bank['icon'].toString().substring(1);
                                final image = '$apiImage$imagex';
                                return Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductScreen(
                                            items: bank['items'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              height: 70,
                                              width: 70,
                                              child: Image.network(image)),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            bank['title']!,
                                            maxLines: 2,
                                            style: GoogleFonts.delaGothicOne(
                                              color: const Color.fromARGB(
                                                  255, 83, 83, 83),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}

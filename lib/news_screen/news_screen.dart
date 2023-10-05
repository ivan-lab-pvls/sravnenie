import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sravnenie/news_screen/news_data.dart';

import 'news_open.dart';

final List<String> _addToListMine = [];

final List<String> _viewedNews = [];

class NewsPageScreen extends StatefulWidget {
  const NewsPageScreen({Key? key}) : super(key: key);

  @override
  State<NewsPageScreen> createState() => _NewsPageScreenState();
}

class _NewsPageScreenState extends State<NewsPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              "Новости",
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
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Stack(
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (!_viewedNews.contains(News.newsGet[index].name)) {
                        setState(() {
                          _viewedNews.add(News.newsGet[index].name);
                        });
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NewDaaata(
                            news: News.newsGet[index],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: Container(
                            height: 175,
                            width: double.infinity,
                            color: const Color.fromARGB(255, 234, 234, 234),
                            child: Image.network(
                              News.newsGet[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          News.newsGet[index].name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.delaGothicOne(
                            color: const Color.fromARGB(255, 83, 83, 83),
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          News.newsGet[index].description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.delaGothicOne(
                            color: const Color.fromARGB(255, 114, 113, 113),
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Icon(
                          _addToListMine.contains(
                            News.newsGet[index].name,
                          )
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          if (_addToListMine
                              .contains(News.newsGet[index].name)) {
                            setState(() {
                              _addToListMine.removeWhere((element) =>
                                  element == News.newsGet[index].name);
                            });
                          } else {
                            setState(() {
                              _addToListMine.add(News.newsGet[index].name);
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: News.newsGet.length,
            ),
          ],
        ),
      ],
    );
  }
}

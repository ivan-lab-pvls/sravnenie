import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:sravnenie/values/constants.dart';
import 'package:url_launcher/url_launcher.dart';

final InAppReview openInApp = InAppReview.instance;

void openSupportFormsWithLink(String linkForContact) async {
  if (await canLaunch(linkForContact)) {
    await launch(linkForContact);
  } else {
    throw 'Could not launch $linkForContact';
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Настройки",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.delaGothicOne(
                    color: const Color.fromARGB(255, 83, 83, 83),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            InkWell(
              onTap: () {
                openInApp.openStoreListing(appStoreId: appIdForShowReview);
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * .95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 192, 184, 93)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).cardColor,
                    ),
                    const Spacer(),
                    Text(
                      'Оценить приложение',
                      style: GoogleFonts.delaGothicOne(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                openSupportFormsWithLink(privacy);
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * .95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 219, 219, 219)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.edit_document,
                      color: Color.fromARGB(255, 83, 83, 83),
                    ),
                    const Spacer(),
                    Text(
                      'Правила использования',
                      style: GoogleFonts.delaGothicOne(
                        color: const Color.fromARGB(255, 83, 83, 83),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                openSupportFormsWithLink(terms);
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * .95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 219, 219, 219)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.security,
                      color: Color.fromARGB(255, 83, 83, 83),
                    ),
                    const Spacer(),
                    Text(
                      'Политика безопасности',
                      style: GoogleFonts.delaGothicOne(
                        color: const Color.fromARGB(255, 83, 83, 83),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                openSupportFormsWithLink(support);
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * .95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 219, 219, 219)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.support_agent,
                      color: Color.fromARGB(255, 83, 83, 83),
                    ),
                    const Spacer(),
                    Text(
                      'Написать в поддержку',
                      style: GoogleFonts.delaGothicOne(
                        color: const Color.fromARGB(255, 83, 83, 83),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Text(
              'Версия приложения: 1.0.0',
              style: GoogleFonts.delaGothicOne(
                color: const Color.fromARGB(255, 196, 194, 194),
                fontSize: 10,
                fontWeight: FontWeight.w200,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}

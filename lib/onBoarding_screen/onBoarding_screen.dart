import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sravnenie/nav/navigation.dart';

final InAppReview inAppReview = InAppReview.instance;
class OnBoardingFirstScreen extends StatefulWidget {
  const OnBoardingFirstScreen({super.key});

  @override
  State<OnBoardingFirstScreen> createState() => _OnBoardingFirstScreenState();
}

class _OnBoardingFirstScreenState extends State<OnBoardingFirstScreen> {
  final PageController _controller = PageController();
  Future<void> setStarsForApp() async {
  if (await inAppReview.isAvailable()) {
    inAppReview.requestReview();
  }
}
  final List<Widget> _pages = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                "assets/images/1.png",
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Добро пожаловать!',
            style: GoogleFonts.delaGothicOne(
              color: const Color.fromARGB(255, 66, 65, 65),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'В нашем приложении вы можете открыть уникальные возможности сравнений!',
            textAlign: TextAlign.center,
            style: GoogleFonts.delaGothicOne(
              color: const Color.fromARGB(255, 66, 65, 65),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                "assets/images/2.png",
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Читайте новости',
            style: GoogleFonts.delaGothicOne(
              color: const Color.fromARGB(255, 66, 65, 65),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Читайте новости прямо у нас! Самые актуальные статьи публикуются каждый день.',
            textAlign: TextAlign.center,
            style: GoogleFonts.delaGothicOne(
              color: const Color.fromARGB(255, 66, 65, 65),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                "assets/images/3.png",
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Категории',
            style: GoogleFonts.delaGothicOne(
              color: const Color.fromARGB(255, 66, 65, 65),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Все наши финансовые категории сравнений расположены ровно по порядку и просты в использовании!',
            textAlign: TextAlign.center,
            style: GoogleFonts.delaGothicOne(
              color: const Color.fromARGB(255, 66, 65, 65),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                "assets/images/4.png",
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Мы рады Вас видеть!',
            style: GoogleFonts.delaGothicOne(
              color: const Color.fromARGB(255, 66, 65, 65),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Давайте начнем! Оценивайте! Делитесь!',
            textAlign: TextAlign.center,
            style: GoogleFonts.delaGothicOne(
              color: const Color.fromARGB(255, 66, 65, 65),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  ];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 227, 227),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              controller: _controller,
              children: _pages,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                onDotClicked: (index) {
                  _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                controller: _controller,
                count: 4,
                effect: const WormEffect(
                  activeDotColor: Color.fromARGB(255, 255, 200, 2),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _currentPage != 3
          ? Padding(
            padding: const EdgeInsets.only(left:40.0, bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
                child: FloatingActionButton.extended(
                  backgroundColor: const Color.fromARGB(255, 213, 193, 18),
                  onPressed: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  label: Row(
                    children: [
                      const SizedBox(width: 60),
                      Text(
                        "Продолжить",
                        style: GoogleFonts.dmSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 1),
                      const Icon(
                        Icons.arrow_right_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 60),
                    ],
                  ),
                ),
              ),
          )
          : Padding(
            padding: const EdgeInsets.only(left:40.0, bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
                child: FloatingActionButton.extended(
                backgroundColor: const Color.fromARGB(255, 88, 197, 30),
                onPressed: () {
                  RxSharedPreferences.getInstance()
                      .setBool("isFirstLoggin", true);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const MainScreen(),
                    ),
                  );
                  setStarsForApp();
                },
                label: Row(
                  children: [
                    const SizedBox(width: 60),
                    Text(
                      "Начать",
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 60),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}

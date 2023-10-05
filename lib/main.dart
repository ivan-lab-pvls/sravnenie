import 'package:flutter/material.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:sravnenie/values/colors.dart';
import 'nav/navigation.dart';
import 'onBoarding_screen/onBoarding_screen.dart';
import 'values/constants.dart';
import 'values/details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final RxSharedPreferences prefs = RxSharedPreferences.getInstance();
  final bool isFirstStart = await prefs.getBool("isFirstLoggin") ?? false;
  api = showDex(api, mns);
  apiImage = showDex(apiImage, mns);
  runApp(MyApp(isFirstStart: isFirstStart));
}

class MyApp extends StatelessWidget {
  final bool isFirstStart;

  const MyApp({super.key, required this.isFirstStart});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isFirstStart ? const MainScreen() : const OnBoardingFirstScreen(),
    );
  }
}

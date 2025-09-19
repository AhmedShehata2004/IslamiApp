import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_details.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/new_theme.dart';
import 'package:islami_app/quran/sura_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami App',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightMode,
      initialRoute: "/",
      routes: {
		"/": (context) => HomeScreen(),
	    SuraDetailsScreen.routeName: (context) => const SuraDetailsScreen(),
		HadethDetails.routeName: (context) => const HadethDetails(),		
	  },
      // home: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_tab.dart';
import 'package:islami_app/new_theme.dart';
import 'package:islami_app/quran/quran_tab.dart';
import 'package:islami_app/radio/radio_tab.dart';
import 'package:islami_app/sebha/sebha_tab.dart';
import 'package:islami_app/settings/settings_tab.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];
  onTappedMethod(index) {
    currentIndex = index;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/default_bg.png",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),

        Scaffold(
          appBar: AppBar(
            title: Text('Islami', style: Theme.of(context).textTheme.bodyLarge),
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: MyTheme.primaryLight),
            child: BottomNavigationBar(
              onTap: onTappedMethod,
              currentIndex: currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                  label: "Quran",
                ),
                BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage( "assets/images/icon_hadeth.png")),
                  label: "Hadeth",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                  label: "Sebha",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                  label: "Radio",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                  label: "Settings",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

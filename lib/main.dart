import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/hadeth/hadeth_details.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/new_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/quran/sura_details.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppConfigProvider(),
    child: const MyApp()),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
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

      locale: Locale( provider.appLanguage,),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

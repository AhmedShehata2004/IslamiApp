import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/new_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> sebhaAzkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
    "لا حول ولا قوة إلا بالله",
  ];

  // المتغيرات التي سيتم تغييرها
  int counter = 0;
  int azkarIndex = 0;
  double rotationAngle = 0.0;

  // دالة لزيادة العدد وتدوير المسبحة وتغيير الذكر
  void onTasbehPress() {
    setState(() {
      // زيادة العدد
      counter++;
      // زيادة زاوية الدوران بمقدار ثابت
      rotationAngle += 0.1;

      // عند الوصول إلى 33، نقوم بتغيير الذكر
      if (counter == 34) {
        counter = 0;
        azkarIndex++;
        // إذا وصلنا إلى نهاية القائمة، نعود للبداية
        if (azkarIndex == sebhaAzkar.length) {
          azkarIndex = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // استخدم ThemeData لضمان توافق الألوان مع المظهر
    var theme = Theme.of(context);
    var provider = Provider.of<AppConfigProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // رأس المسبحة
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset("assets/images/head_sebha_logo.png"),
              // جسم المسبحة مع خاصية الدوران عند الضغط
              GestureDetector(
                onTap: onTasbehPress,
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Transform.rotate(
                    angle: rotationAngle,
                    child: Image.asset("assets/images/body_sebha_logo.png"),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),
          Text(
            AppLocalizations.of(context)!.number_of_tasbeeh,
            style: provider.isDarkMode()
                ? theme.textTheme.titleLarge?.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.white,
                  )
                :
            theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:
                  provider.isDarkMode()
                      ? MyTheme.yellowColor
                      : MyTheme.primaryLight,
            ),
            child: Text(
              "$counter",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color:  provider.isDarkMode()
                      ? MyTheme.yellowColor
                      : MyTheme.primaryLight,
            ),
            child: Text(
              sebhaAzkar[azkarIndex],
              style: TextStyle(
                fontSize: 30,
                color:  provider.isDarkMode()
                      ? MyTheme.black
                      : MyTheme.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

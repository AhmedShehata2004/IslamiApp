import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/new_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // مهم
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context); // يقفل البوتوم شيت بعد الاختيار
            },
            child: provider.appTheme == ThemeMode.light
                ? getSelectedWidget(AppLocalizations.of(context)!.light_mode)
                : getUnselectedWidget(AppLocalizations.of(context)!.light_mode),
          ),
          const SizedBox(height: 10),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 1.5,
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context); // يقفل البوتوم شيت بعد الاختيار
            },
            child: provider.isDarkMode()
                ? getSelectedWidget(AppLocalizations.of(context)!.dark_mode)
                : getUnselectedWidget(AppLocalizations.of(context)!.dark_mode),
          ),
        ],
      ),
    );
  }

  Widget getSelectedWidget(String text) {
      var provider = Provider.of<AppConfigProvider>(context);
    return Row(
      children: [
        Text(
          text,
          style:  provider.isDarkMode()
              ? Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: MyTheme.yellowColor,
                  fontWeight: FontWeight.bold,
                )
              : Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),

        ),
        const Spacer(),
        Icon(Icons.check, size: 28, color: MyTheme.yellowColor),
      ],
    );
  }

  Widget getUnselectedWidget(String text) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Text(
      text,
      style: provider.isDarkMode()
              ? Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: MyTheme.primaryDark,
                  fontWeight: FontWeight.bold,
                )
              : Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
    );
  }
}

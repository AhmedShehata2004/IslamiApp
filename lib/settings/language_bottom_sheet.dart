import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              // Change app language to English
              provider.changeLanguage("en");
            },
            child:  provider.appLanguage == "en"
                ? getSelectedWidget(AppLocalizations.of(context)!.english)
                : getUnselectedWidget(AppLocalizations.of(context)!.english,),
          ),
          SizedBox(height: 10),
          Divider(color: Theme.of(context).primaryColor, thickness: 2),
          InkWell(
            onTap: () {
              // Change app language to Arabic
              provider.changeLanguage("ar");
            },
            child: provider.appLanguage == "ar"
                ? getSelectedWidget(AppLocalizations.of(context)!.arabic)
                : getUnselectedWidget(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget getSelectedWidget(String text) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Icon(Icons.check, size: 35, color: Theme.of(context).primaryColor),
      ],
    );
  }
  getUnselectedWidget(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

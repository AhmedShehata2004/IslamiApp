import 'package:flutter/material.dart';
import 'package:islami_app/new_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/quran/sura_details.dart';
import 'package:provider/provider.dart';

class SuraItems extends StatelessWidget {
  final String suraName;
  final int suraVerses;
  final int index;

  const SuraItems({
    Key? key,
    required this.suraName,
    required this.suraVerses,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetailsScreen.routeName,
          arguments: {'sura_name': suraName, 'sura_index': index},
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              suraName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            width: 1,
            height: 40,
            color:  provider.isDarkMode()
                        ? MyTheme.yellowColor
                        : MyTheme.primaryLight,
          ),
          Expanded(
            child: Text(
              suraVerses.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

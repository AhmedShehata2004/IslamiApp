import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/new_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
        var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/radio_image.png"),
        SizedBox(height: 20,),
        Text(
          AppLocalizations.of(context)!.ezaat_alquran_alkarem , 
          style: provider.isDarkMode()
                ? Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: MyTheme.white,
                  )
                :
           Theme.of(context).textTheme.bodyLarge,
          ),
        SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.skip_previous ,
             color: 
             provider.isDarkMode()
                        ? MyTheme.yellowColor
                        :
             MyTheme.primaryLight,size: 60,
             ),
            SizedBox(width: 20,),
            Icon(Icons.play_arrow , color: provider .isDarkMode()
                        ? MyTheme.yellowColor
                        :
             MyTheme.primaryLight, size: 70,),
            SizedBox(width: 20,),
            Icon(Icons.skip_next , color: provider.isDarkMode()
                        ? MyTheme.yellowColor
                        :
             MyTheme.primaryLight,size: 60,),
          ],
        )
      ],
    );
  }
}

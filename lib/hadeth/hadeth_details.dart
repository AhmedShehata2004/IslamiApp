import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/hadeth/hadeth_tab.dart';
import 'package:islami_app/new_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatelessWidget {
  const HadethDetails({super.key});
  static const String routeName = "hadeth_details";

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as Hadeth;
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode()
            ? Image.asset(
                "assets/images/dark_bg.png",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )
            :
        Image.asset(
          "assets/images/default_bg.png",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title , style: Theme.of(context).textTheme.bodyLarge),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 60.0,
            ),
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                
                color: provider.isDarkMode()
                    ? MyTheme.primaryDark
                    :
                 Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(arg.title, style: Theme.of(context).textTheme.bodyLarge),

                  Divider(
                    
                    color:provider.isDarkMode()
                        ? MyTheme.yellowColor
                        :
                     MyTheme.primaryLight,
                     thickness: 2,),

                  const SizedBox(height: 8),

                  Expanded(
                    child: ListView.builder(
                      itemCount: arg.content.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 6.0,
                          ),
                          child: Text(
                            arg.content[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(fontSize: 18, height: 2),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

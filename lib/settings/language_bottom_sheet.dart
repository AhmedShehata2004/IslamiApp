import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
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
          Row(
            children: [
              Text(AppLocalizations.of(context)!.english, style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).primaryColor,  
                fontWeight: FontWeight.bold,
              )),
              Spacer(),
              Icon(Icons.check, size: 35, color: Theme.of(context).primaryColor,), 
            ],
          ),
          SizedBox(height: 10),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: 2,
          ),
          Text(AppLocalizations.of(context)!.arabic, style: Theme.of(context).textTheme.bodyLarge),

        ],
      ),
    );
  }
}
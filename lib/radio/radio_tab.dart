import 'package:flutter/material.dart';
import 'package:islami_app/new_theme.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/radio_image.png"),
        SizedBox(height: 20,),
        Text("Ezaat AlQuran AlKarem ", style: Theme.of(context).textTheme.headlineMedium,),
        SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.skip_previous , color: MyTheme.primaryLight,size: 60,),
            SizedBox(width: 20,),
            Icon(Icons.play_arrow , color: MyTheme.primaryLight, size: 70,),
            SizedBox(width: 20,),
            Icon(Icons.skip_next , color: MyTheme.primaryLight,size: 60,),
          ],
        )
      ],
    );
  }
}

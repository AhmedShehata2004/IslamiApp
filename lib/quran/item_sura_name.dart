import 'package:flutter/material.dart';
import 'package:islami_app/quran/sura_details.dart';

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
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetailsScreen.routeName,
          arguments: {
            'sura_name': suraName,
            'sura_index': index, // هنا انت بالفعل بتبعت الـ index بشكل صحيح
            'sura_verses': suraVerses, // لو محتاج تبعت عدد الآيات كمان
          },
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
            color: const Color.fromARGB(255, 219, 130, 21),
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
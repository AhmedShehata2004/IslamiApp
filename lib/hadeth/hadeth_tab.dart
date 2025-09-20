import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/hadeth/hadeth_details.dart';
import 'package:islami_app/new_theme.dart';
class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadHadethFile();
    }
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/hadeth_logo.png"),
          Divider(color: MyTheme.primaryLight, thickness: 2),
          Text(AppLocalizations.of(context)!.hadeth_name,style: Theme.of(context).textTheme.bodyLarge),
          Divider(color: MyTheme.primaryLight, thickness: 2),

          ahadeth.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                child: ListView.separated(
                  itemCount: ahadeth.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          HadethDetails.routeName,
                          arguments: Hadeth(
                            ahadeth[index].title,
                            ahadeth[index].content,
                          ),
                        );
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            ahadeth[index].title,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder:
                      (context, index) => Divider(
                        color: const Color.fromARGB(255, 149, 131, 108),
                        thickness: 1,
                        height: 0,
                      ),
                ),
              ),
        ],
      ),
    );
  }

  void loadHadethFile() async {
    String ahadethContent = await rootBundle.loadString(
      "assets/ahadeth_file.txt",
    );
    List<String> ahadethList = ahadethContent.split("#\r\n");
    for (int i = 0; i < ahadethList.length; i++) {
      List<String> hadethLines = ahadethList[i].split("\r\n");
      String hadethName = hadethLines[0];
      hadethLines.removeAt(0);
      // String hadethContent = hadethLines.sublist(1).join("\n");
      Hadeth hadeth = Hadeth(hadethName, hadethLines);
      ahadeth.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;
  Hadeth(this.title, this.content);
}

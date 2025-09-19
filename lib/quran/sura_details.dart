import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/new_theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});
  static const String routeName = 'sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> suraLines = [];
  bool isLoading = true;
  String? suraName;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int suraIndex = args['sura_index'];
    suraName = args['sura_name'];

    loadSuraContent(suraIndex);
  }

  Future<void> loadSuraContent(int suraIndex) async {
    String fileName = 'assets/quran_files/$suraIndex.txt';
    String suraContent = await rootBundle.loadString(fileName);
    List<String> lines = suraContent.split('\n');
    setState(() {
      suraLines = lines;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/default_bg.png",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Islami', style: Theme.of(context).textTheme.bodyLarge),
            backgroundColor: Colors.transparent,
            elevation: 0,
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        suraName ?? "",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.play_circle, color: Colors.black),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Divider(color: MyTheme.primaryLight, thickness: 2),

                  const SizedBox(height: 8),

                  /// ✅ عرض الآيات كل آية في سطر داخل ListView
                  Expanded(
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: suraLines.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 6.0),
                                child: Text(
                                  suraLines[index],
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
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

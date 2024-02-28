import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../details/hadeth_details.dart';
import '../models/hadeth_model.dart';
import '../my_theme.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> ahadethData = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethData.isEmpty) {
      loadHadethFile();
    }

    return Column(
      children: [
        Center(
          child: Image.asset(
            "assets/images/hadeth_logo.png",
            height: MediaQuery.of(context).size.height * .21,
          ),
        ),
        Divider(
          thickness: 3,
          color: MyThemeData.primaryColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              AppLocalizations.of(context)!.ahadeth,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Divider(
          thickness: 3,
          color: MyThemeData.primaryColor,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 2,
                color: MyThemeData.primaryColor,
                indent: 30,
                endIndent: 30,
              );
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetails.routeName,
                      arguments: ahadethData[index]);
                },
                child: Text(
                  ahadethData[index].title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            },
            itemCount: ahadethData.length,
          ),
        )
      ],
    );
  }

  loadHadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then(
      (hadethFile) {
        List<String> ahadeth = hadethFile.split("#");
        for (int i = 0; i < ahadeth.length; i++) {
          String hadeth = ahadeth[i];
          List<String> hadethLines = hadeth.trim().split("\n");
          String title = hadethLines[0];
          hadethLines.removeAt(0);
          List<String> hadethContent = hadethLines;
          ahadethData.add(HadethModel(title: title, content: hadethContent));
        }
        setState(() {});
      },
    );
  }
}

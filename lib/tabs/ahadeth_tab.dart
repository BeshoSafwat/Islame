import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:isllame/hadeth_details/hadeth_details_provider.dart';
import 'package:provider/provider.dart';
import '../hadeth_details/hadeth_details.dart';
import '../my_theme.dart';

class AhadethTab extends StatelessWidget {
  AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HadethDetailsProvider>(
      create: (context) => HadethDetailsProvider(),
      builder: (context, child) {
        var provider = Provider.of<HadethDetailsProvider>(context)
          ..loadHadethFile();
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
                          arguments: provider.ahadethData[index]);
                    },
                    child: Text(provider.ahadethData[index].title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium),
                  );
                },
                itemCount: provider.ahadethData.length,
              ),
            )
          ],
        );
      },
    );
  }
}

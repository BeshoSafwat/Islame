import 'package:flutter/material.dart';
import 'package:isllame/my_theme.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                provider.changeLanguage("en");
              },
              child: Text("English",
                  style: provider.languageCode == "en"
                      ? Theme.of(context).textTheme.displayLarge
                      : Theme.of(context).textTheme.displayMedium),
            ),
            if (provider.languageCode == "en") ...[
              Icon(Icons.done, size: 30, color: MyThemeData.primaryColor),
            ]
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                provider.changeLanguage("ar");
              },
              child: Text("العربية",
                  style: provider.languageCode == "ar"
                      ? Theme.of(context).textTheme.displayLarge
                      : Theme.of(context).textTheme.displayMedium),
            ),
            if (provider.languageCode == "ar") ...[
              Icon(Icons.done, size: 30, color: MyThemeData.primaryColor),
            ]
          ],
        )
      ]),
    );
  }
}

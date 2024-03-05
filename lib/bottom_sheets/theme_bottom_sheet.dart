import 'package:flutter/material.dart';
import 'package:isllame/my_theme.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  ThemeBottomSheet({super.key});

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
                provider.changeTheme(ThemeMode.light);
              },
              child: Text("Light",
                  style: TextStyle(
                      color: provider.themeMode == ThemeMode.light
                          ? MyThemeData.primaryColor
                          : MyThemeData.scecondryColor)),
            ),
            if (provider.themeMode == ThemeMode.light) ...[
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
                provider.changeTheme(ThemeMode.dark);
              },
              child: Text("Dark",
                  style: TextStyle(
                      color: provider.themeMode == ThemeMode.dark
                          ? MyThemeData.primaryColor
                          : MyThemeData.scecondryColor)),
            ),
            if (provider.themeMode == ThemeMode.dark) ...[
              Icon(Icons.done, size: 30, color: MyThemeData.primaryColor),
            ]
          ],
        )
      ]),
    );
  }
}

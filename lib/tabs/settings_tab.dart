import 'package:flutter/material.dart';
import 'package:isllame/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../bottom_sheets/language_bottom_sheet.dart';
import '../bottom_sheets/theme_bottom_sheet.dart';
import '../providers/my_provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                    height: 400,
                    child: LanguageBottomSheet(),
                  );
                },
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: MyThemeData.primaryColor)),
              child: Center(
                child: Text(
                  provider.NameLanguage(),
                  style: TextStyle(color: MyThemeData.primaryColor),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .01),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                    height: 400,
                    child: ThemeBottomSheet(),
                  );
                },
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: MyThemeData.primaryColor)),
              child: Center(
                child: Text(
                  provider.NameTheme(),
                  style: TextStyle(color: MyThemeData.primaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

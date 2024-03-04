import 'package:flutter/material.dart';
import 'package:isllame/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bottom_sheets/language_bottom_sheet.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
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
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: MyThemeData.primaryColor)),
              child: Center(
                child: Text(
                  "العربية",
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
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: MyThemeData.primaryColor)),
            child: Center(
              child: Text(
                "Light",
                style: TextStyle(color: MyThemeData.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

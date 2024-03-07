import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isllame/sura_details/sura_details_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/sura_model.dart';
import '../providers/my_provider.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = "SuraDetailsScreen";

  SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;
    var pro = Provider.of<MyProvider>(context);


    return SafeArea(
      child: ChangeNotifierProvider<SuraDetailsProvider>(
        create: (context) => SuraDetailsProvider()..loadFile(model.index),
        builder: (context, child) {
          var provider = Provider.of<SuraDetailsProvider>(context);
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(pro.getBackgroundPath()),
                fit: BoxFit.fill,
              ),
            ),
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  AppLocalizations.of(context)!.islamy,
                ),
              ),
              body: Card(
                margin: EdgeInsets.all(20),
                color: pro.themeMode == ThemeMode.light
                    ? Color(0xffF8F8F8).withOpacity(.99)
                    : Color(0xff141A2E).withOpacity(.99),
                shape: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.transparent)),
                child: Column(
                  children: [
                    Text(
                      model.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Divider(
                      thickness: 3,
                      indent: 50,
                      endIndent: 50,
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 12,
                          );
                        },
                        itemBuilder: (context, index) {
                          return Text(
                            provider.verses[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          );
                        },
                        itemCount: provider.verses.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

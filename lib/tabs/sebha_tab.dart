import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../my_theme.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turns = 0.0;
  List<String> sebhaList = [
    "سبحان الله",
    "الحمدلله",
    "لا اله الا الله",
    "الله اكبر",
    "استغفر الله"
  ];
  int sebhaNumber = 0;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 290, left: 70),
                  child: Image.asset("assets/images/head_sebha_logo.png")),
              AnimatedRotation(
                turns: turns,
                duration: Duration(milliseconds: 80),
                child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setState(() {
                        turns += (1 / 30);
                        sebhaTextChange();
                      });
                    },
                    child: Image.asset("assets/images/body_sebha_logo.png")),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  AppLocalizations.of(context)!.tasbehnumber,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  height: 50,
                  width: 70,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(183, 147, 95, 80),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${sebhaNumber}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: MyThemeData.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("${sebhaList[counter]}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
            ],
          )
        ],
      ),
    );
  }

  void sebhaTextChange() {
    sebhaNumber++;
    if (sebhaNumber == 33) {
      sebhaNumber = 0;
      if (counter == (sebhaList.length - 1)) {
        counter = 0;
      } else {
        counter++;
      }
    }
    setState(() {});
  }
}
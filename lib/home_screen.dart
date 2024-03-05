import 'package:flutter/material.dart';
import 'package:isllame/providers/my_provider.dart';
import 'package:isllame/tabs/ahadeth_tab.dart';
import 'package:isllame/tabs/quran_tab.dart';
import 'package:isllame/tabs/radio_tab.dart';
import 'package:isllame/tabs/sebha_tab.dart';
import 'package:isllame/tabs/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            provider.getBackgroundPath(),
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.islamy,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: index,
                onTap: (value) {
                  index = value;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(
                        "assets/images/icon_quran.png",
                      )),
                      label: "Quran"),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                      label: "Sebha"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                          AssetImage("assets/images/icon_hadeth.png")),
                      label: "Ahadeth"),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage("assets/images/icon_radio.png")),
                      label: "Ahadeth"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "Settings"),
                ]),
            body: tabs[index],
          ),
        ],
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    AhadethTab(),
    RadioTab(),
    SettingsTab(),
  ];
}

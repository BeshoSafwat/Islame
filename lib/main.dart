import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:isllame/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'hadeth_details/hadeth_details.dart';
import 'sura_details/sura_details.dart';
import 'home_screen.dart';
import 'my_theme.dart';


void main() {
  runApp(ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider() ,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,
      locale: Locale(provider.languageCode),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetails.routeName: (context) => const HadethDetails(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

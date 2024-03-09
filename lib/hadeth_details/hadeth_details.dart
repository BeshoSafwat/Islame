import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/hadeth_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/my_provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "HadethDetails";

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as HadethModel;
    var provider = Provider.of<MyProvider>(context);
    var pro = Provider.of<MyProvider>(context);

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(provider.getBackgroundPath()),
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
            margin: const EdgeInsets.all(20),
            color: provider.themeMode == ThemeMode.light
                ? const Color(0xffF8F8F8).withOpacity(.99)
                : const Color(0xff141A2E).withOpacity(.99),
            shape: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.transparent)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    model.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Divider(
                    thickness: 3,
                    indent: 50,
                    endIndent: 50,
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 12,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Text(
                          model.content[index],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        );
                      },
                      itemCount: model.content.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

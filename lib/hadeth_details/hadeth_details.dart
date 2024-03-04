import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/hadeth_model.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "HadethDetails";

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as HadethModel;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/default_bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Islame",
            ),
          ),
          body: Card(
            margin: EdgeInsets.all(20),
            color: Color(0xffF8F8F8).withOpacity(.99),
            shape: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.transparent)),
            child: Column(
              children: [
                Text(
                  model.title,
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
    );
  }
}

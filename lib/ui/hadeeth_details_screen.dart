import 'package:flutter/material.dart';
import 'package:islami_app/core/styles/colors.dart';
import 'package:islami_app/model/hadeeth_dm.dart';
import 'package:islami_app/ui/widget/content_details_widget.dart';

class HadeethDetailsScreen extends StatelessWidget {
  static const String routeName = "/HadeethDetailsScreen";

  const HadeethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hadeeth = ModalRoute.of(context)?.settings.arguments as HadeethDM;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hadeeth Details"),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.gold,
      ),
      body: ContentDetailsWidget(
        title: hadeeth.title,
        content: hadeeth.content,
      ),
    );
  }
}

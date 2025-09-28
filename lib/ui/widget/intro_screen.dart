import 'package:flutter/material.dart';

import '../../core/styles/text_styles.dart';

class IntroScreenWidget extends StatefulWidget {
  final String image;
  final String title;
  final String content;

  const IntroScreenWidget({
    required this.image,
    required this.title,
    required this.content,
    super.key,
  });

  @override
  State<IntroScreenWidget> createState() => _IntroScreenWidgetState();
}

class _IntroScreenWidgetState extends State<IntroScreenWidget> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/Logo.png",
              width: mediaQuery.width * 0.7,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Image.asset(
                widget.image,
                width: double.infinity,
                height: mediaQuery.height * 0.5,
              ),
            ),
          ),
          Text(widget.title, style: TextStyles.mediumLabel()),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.content, style: TextStyles.smallLabel()),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../widget/radio_card.dart';

class RadioTabDesign extends StatelessWidget {
  const RadioTabDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            RadioCard(label: "Ibraheem El-Akhdar"),
            RadioCard(label: "Al-Qaria Yassenr",icon: Icons.pause,),
            RadioCard(label: "Ahmed Al-trabulsi"),
            RadioCard(label: " Addokali Mohammad Alalim"),
            RadioCard(label: "Ibraheem El-Akhdar"),
            RadioCard(label: "Al-Qaria Yassenr"),
            RadioCard(label: "Ahmed Al-trabulsi"),
            RadioCard(label: " Addokali Mohammad Alalim"),
            RadioCard(label: "Ibraheem El-Akhdar"),
            RadioCard(label: "Al-Qaria Yassenr"),
            RadioCard(label: "Ahmed Al-trabulsi"),
            RadioCard(label: " Addokali Mohammad Alalim"),
          ],
        ),
      ],
    );
  }
}

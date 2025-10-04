import 'package:flutter/material.dart';

import '../../../widget/radio_card.dart';

class RecitersTabDesign extends StatefulWidget {
  const RecitersTabDesign({super.key});

  @override
  State<RecitersTabDesign> createState() => _RecitersTabDesignState();
}

class _RecitersTabDesignState extends State<RecitersTabDesign> {
  List<RadioCard> radios = [
    RadioCard(label: "Ibraheem El-Akhdar"),
    RadioCard(label: "Al-Qaria Yassenr", icon: Icons.pause),
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
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: radios.length,
        separatorBuilder:
            (context, index) => SizedBox(height: size.height * 0.001),
        itemBuilder: (context, index) => Column(children: [radios[index]]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vanilla/widgets/subscribeCard.dart';
import 'package:vanilla/widgets/textWidget.dart';


class FilterExplorePage extends StatefulWidget {
  const FilterExplorePage({Key? key}) : super(key: key);

  @override
  State<FilterExplorePage> createState() => _FilterExplorePageState();
}

class _FilterExplorePageState extends State<FilterExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black87,
        ),
        elevation: 0,
        centerTitle: true,
        title: TextWidget(
          text: 'Filter Settings',
          fontSize: 20,
          color: const Color(0xFFB81F8F),
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.white10,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SubBanner(),


        ],
      ),
    );
  }
}

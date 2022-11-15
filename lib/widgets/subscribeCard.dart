import 'package:flutter/material.dart';
import 'package:vanilla/widgets/subscribePopUp.dart';
import 'package:vanilla/widgets/textWidget.dart';

class SubBanner extends StatefulWidget {
  const SubBanner({Key? key}) : super(key: key);

  @override
  State<SubBanner> createState() => _SubBannerState();
}

class _SubBannerState extends State<SubBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/banner.png'),
          fit: BoxFit.cover,
        )
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 13,
          ),
          TextWidget(
            text: "You're on our free plan",
            fontSize: 20,
            isUnderLine: true,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          TextWidget(
            text: 'You want to make the most out of Vanilla?',
            fontSize: 16,
            isUnderLine: true,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => subscribeButton());
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  'Become VIP member',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: "Proxima Nova",
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

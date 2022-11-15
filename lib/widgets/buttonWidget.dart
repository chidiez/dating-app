import 'package:flutter/material.dart';


class ButtonWidget extends StatelessWidget {
  final  onPressed;
  final String text;

  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFB81F8F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          //backgroundColor: Colors.purple,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: 'Proxima Nova',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}



class RegButtonWidget extends StatelessWidget {
  final  onPressed;
  final String text;

  const RegButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFB81F8F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          //backgroundColor: Colors.purple,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: 'Proxima Nova',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}




class ButtonNextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String option;
  final onTap;

   ButtonNextWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.option,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      height: 45,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(
        left: 20,
        right: 16,
      ),
      decoration: BoxDecoration(
        //color: Colors.grey[100],
        borderRadius: BorderRadius.circular(6),
        //border: Border.all(color: Colors.blueGrey),
      ),
      child: buildContent(),
    ),
  );

  Widget buildContent() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Proxima Nova',
        ),
      ),
      Row(
        children: [
          Text(
            option,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFFB81F8F),
              fontFamily: 'Proxima Nova',
            ),
          ),
          Icon(
            icon,
            size: 14,
          ),
        ],
      ),
    ],
  );
}

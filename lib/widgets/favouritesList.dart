import 'package:flutter/material.dart';
import 'package:vanilla/widgets/profileCard.dart';

class FavouritesList extends StatelessWidget {

  final String text;

  FavouritesList({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const profilePublicView()));
            },
            child: Container(
              width: 65,
              height: 65,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFB81F8F),
              ),
              child: const CircleAvatar(
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                //radius: 35,
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Text(text, style: TextStyle(fontFamily: 'Proxima Nova',),),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vanilla/widgets/profileCard.dart';

class FavouritesCardWidget extends StatefulWidget {
  const FavouritesCardWidget({Key? key}) : super(key: key);

  @override
  State<FavouritesCardWidget> createState() => _FavouritesCardWidgetState();
}

class _FavouritesCardWidgetState extends State<FavouritesCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Ink.image(image: const NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                height: 220,
                width: 160,
                fit: BoxFit.cover,
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const profilePublicView()));
                  },
                ),
              ),
              const Positioned(
                bottom: 20,
                right: 20,
                left: 10,
                child: Text('Ezed, 25',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Proxima Nova',
                    color: Colors.white,
                  ),
                ),
              ),
              const Positioned(
                bottom: 10,
                left: 10,
                //right: 20,
                child: Text('19km',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Proxima Nova',
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)),
                  height: 5,
                  width: 5,
                ),
              ),

            ],
          ),
          ButtonBar(
            buttonPadding: EdgeInsets.all(0.0),
            //alignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
                onPressed: (){},
                child: Image.asset('assets/icons/favorites-no.png',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
                onPressed: (){},
                child: Image.asset('assets/icons/favorites-like.png',
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}



class FavouritesCardLikesMeWidget extends StatefulWidget {
  const FavouritesCardLikesMeWidget({Key? key}) : super(key: key);

  @override
  State<FavouritesCardLikesMeWidget> createState() => _FavouritesCardLikesMeWidgetState();
}

class _FavouritesCardLikesMeWidgetState extends State<FavouritesCardLikesMeWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Ink.image(image: const NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                height: 220,
                width: 160,
                fit: BoxFit.cover,
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const profilePublicView()));
                  },
                ),
              ),
              const Positioned(
                bottom: 20,
                right: 20,
                left: 10,
                child: Text('Ezed, 25',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Proxima Nova',
                    color: Colors.white,
                  ),
                ),
              ),
              const Positioned(
                bottom: 10,
                left: 10,
                //right: 20,
                child: Text('19km',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Proxima Nova',
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50,),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),

        ],
      ),

    );
  }
}

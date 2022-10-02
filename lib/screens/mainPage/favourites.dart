import 'package:flutter/material.dart';
import 'package:vanilla/widgets/favouritesCardWidget.dart';

import '../../widgets/textWidget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

enum MenuItem{
  item1,
  item2,
}

final List favourites = ['Ezed', 'Ezed', ];

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: TextWidget(
            text: 'Favourites',
            fontSize: 20,
            color: const Color(0xFFB81F8F),
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: Colors.white10,
          actions: [
            PopupMenuButton<MenuItem>(
              icon: Image.asset('assets/icons/filter.png', color: Colors.black87,),
              onSelected: (value){
                if(value == MenuItem.item1){

                }else if (value == MenuItem.item2){

                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(value: MenuItem.item1, child: Text('Nearby'),),
                PopupMenuItem(value: MenuItem.item2, child: Text('Online'),),
              ],
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          //padding: const EdgeInsets.only(left: 5, top: 20, right: 5,),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const TabBar(
                labelColor: Colors.black87,
                indicatorColor: Colors.black87,
                tabs: [
                  Tab(
                    text: "Likes Me",
                  ),
                  Tab(
                    text: "My Likes",
                  )
                ],
              ),



              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15,),
                            child: Text(
                              "See everyone that liked you",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FavouritesCardLikesMeWidget(),
                              FavouritesCardLikesMeWidget(),
                            ],
                          ),

                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15,),
                            child: Text(
                              "See everyone you liked",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FavouritesCardWidget(),
                              FavouritesCardWidget(),
                            ],
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


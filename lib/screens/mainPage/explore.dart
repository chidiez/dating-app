import 'dart:convert';

import 'package:flutter/material.dart';

import '../../widgets/exploreCardWidget.dart';
import '../../widgets/favouritesList.dart';
import '../../widgets/textWidget.dart';
import '../filterExplore.dart';
import 'favourites.dart';
import 'package:http/http.dart' as http;

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List allOnlineUsers = [];
  getNearByUsers() async {
    var url = Uri.parse('https://hidden-mountain-66153.herokuapp.com/home');
    var response = await http.get(url);
    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body) as List<dynamic>;
      setState(() {
        allOnlineUsers = jsonResponse;
      });
    }
  }
  @override
  void initState() {
    getNearByUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: TextWidget(
            text: 'Explore',
            fontSize: 20,
            color: const Color(0xFFB81F8F),
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: Colors.white10,
          actions: [
            IconButton(
              icon: Image.asset('assets/icons/filter.png', color: Colors.black87,),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FilterExplorePage()));
              },
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          //padding: const EdgeInsets.only(left: 5, right: 5,),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const TabBar(
                labelColor: Colors.black87,
                indicatorColor: Colors.black87,
                tabs: [
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "Nearby",
                  ),
                  Tab(
                    text: "Popular",
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your favourites",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                  Container(
                    height: 111,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: favourites.length,
                        itemBuilder: (context, index) {
                          return FavouritesList(text: favourites[index]);
                        }),
                  ),
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
                                "See everyone in <--->",
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ExploreCardWidget(),
                                ExploreCardWidget(),
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
                              "Less that=n 20km away",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ExploreCardWidget(),
                              ExploreCardWidget(),
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
                              "Top hits in <--->",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ExploreCardWidget(),
                              ExploreCardWidget(),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

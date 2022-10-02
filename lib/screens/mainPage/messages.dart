import 'package:flutter/material.dart';
import 'package:vanilla/screens/directChat.dart';

import '../../widgets/favouritesList.dart';
import '../../widgets/subscribePopUp.dart';
import '../../widgets/textWidget.dart';
import 'favourites.dart';


class MessageListScreen extends StatefulWidget {
  const MessageListScreen({Key? key}) : super(key: key);

  @override
  _MessageListScreenState createState() => _MessageListScreenState();
}
enum MenuItem{
  item1,
  item2,

}

class _MessageListScreenState extends State<MessageListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/icons/vip.png',),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => subscribeButton()
            );
          },
        ),
        elevation: 0,
        centerTitle: true,
        title: TextWidget(
          text: 'Chats',
          fontSize: 20,
          color: const Color(0xFFB81F8F),
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.white10,
        actions: [
          PopupMenuButton<MenuItem>(
            icon: Image.asset('assets/icons/hamburger-menu.png', color: Colors.black87,),
            onSelected: (value){
              if(value == MenuItem.item1){

              }else if (value == MenuItem.item2){

              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: MenuItem.item1, child: Text('Online'),),
              PopupMenuItem(value: MenuItem.item2, child: Text('Unread'),),
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
            buildSearchField(),
            const SizedBox(height: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your favourites", style: TextStyle(color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.w300),),
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
            //const SizedBox(height: 10,),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: const [
                  ListItemCard(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItemCard extends StatelessWidget {
  const ListItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      splashColor: Colors.transparent,
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const directChatScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Row(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                    radius: 30,
                  ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      )
                    ),
                    height: 15,
                    width: 15,
                  ),
                ),
              ],
            ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Ezed",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4,),
                      Text("Last message from user...",
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
              const Opacity(
                opacity: 0.4,
                child: Text("5:26",),
              ),
          ],
        ),
      ),
    );
  }
}

Widget buildSearchField() {
  //const color = Colors.white;

  return TextField(
    style: const TextStyle(),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      hintText: 'Search',
      hintStyle: const TextStyle(),
      prefixIcon: Image.asset('assets/icons/mexplore.png', color: Colors.black45,),
      filled: true,
      fillColor: Colors.grey[200],
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15,),
          borderSide: const BorderSide( color: Colors.white10),
      ),
    ),
  );
}


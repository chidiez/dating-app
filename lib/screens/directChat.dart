import 'package:flutter/material.dart';

import '../widgets/textWidget.dart';

class directChatScreen extends StatefulWidget {
  const directChatScreen({Key? key}) : super(key: key);

  @override
  _directChatScreenState createState() => _directChatScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

ScrollController _scrollController = ScrollController();

class _directChatScreenState extends State<directChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black87,
        ),
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
            ),
            const SizedBox(width: 10,),
            Column(
              children:  [
                TextWidget(
                  text: 'Ezed',
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                TextWidget(
                  text: '3m ago',
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white10,
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/calls.png', color: Colors.black38,),
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            icon: Image.asset('assets/icons/video.png', color: Colors.black38,),
            onPressed: () {
              // handle the press
            },
          ),
          const SizedBox(width: 15,),
        ],
      ),
      body: Container(
        //color: Color.red,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              //height: MediaQuery.of(context).size.height - 190,
              child: ListView(
                controller: _scrollController,
                shrinkWrap: true,
                children: [
                  OwnMessage(),
                  GestureDetector(
                      onDoubleTap: () {
                        // Positioned(
                        //   right: 50,
                        //   bottom: -20,
                        //   child: IconButton(
                        //     icon: Image.asset('assets/icons/like.png', color: Colors.red,),
                        //     onPressed: () {
                        //       // handle the press
                        //     },
                        //   ),
                        // );
                      },
                      child: const ReplyMessage()),
                  const OwnMessage(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Container(
                  height: 70,
                  //color: Colors.grey[800],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 5, bottom: 5),
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xFFB81F8F),
                              ),
                              child: IconButton(
                                //padding: const EdgeInsets.only(right: 19),
                                onPressed: () {
                                  var sheetController = scaffoldKey.currentState
                                      ?.showBottomSheet((context) => bottomSheet());
                                  sheetController?.closed.then((value) {});
                                },
                                icon: Image.asset('assets/icons/add-image.png', color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            child: Card(
                              margin: const EdgeInsets.only(
                                left: 2,
                                right: 2,
                                bottom: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const TextField(
                                //textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "   Aa",
                                  contentPadding: EdgeInsets.all(5),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, bottom: 8),
                            child: CircleAvatar(
                              backgroundColor: Color(0xFFB81F8F),
                              radius: 20,
                              child: IconButton(
                                icon: Image.asset('assets/icons/chat-voice-message.png', color: Colors.white,),
                                onPressed: () {
                                  _scrollController.animateTo(
                                      _scrollController
                                          .position.maxScrollExtent,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeOut);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: const Card(
        margin: EdgeInsets.all(18),
      ),
    );
  }
}

class OwnMessage extends StatelessWidget {
  const OwnMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 55,
        ),
        child: Card(
          elevation: 9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: const Color(0xFFB81F8F),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Stack(
            children: const [
              // Positioned(
              //   left: 8,
              //   top: 1,
              //   child: Text(
              //     'You',
              //     style: TextStyle(
              //       fontSize: 10,
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 50,
                  top: 10,
                  bottom: 20,
                ),
                child: Text(
                  'Do you wanna hear a joke about Joey?',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 4,
                child: Text(
                  "5:26",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReplyMessage extends StatelessWidget {
  const ReplyMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 35,
        ),
        child: Stack(
          children: [
            GestureDetector(
              onDoubleTap: (){
                print('message liked');
              },
              child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.grey[300],
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Stack(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 50,
                      top: 10,
                      bottom: 20,
                    ),
                    child: Text(
                      'Do you wanna hear a joke about Joey?',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 4,
                    child: Text(
                      "5:26",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
          ),
            ),

  ]
        ),
      ),
    );
  }
}

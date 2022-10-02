import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vanilla/widgets/textWidget.dart';

class profilePublicView extends StatefulWidget {
  const profilePublicView({Key? key}) : super(key: key);

  @override
  _profilePublicViewState createState() => _profilePublicViewState();
}

enum MenuItem{
  item1,
  item2,
  item3,
  item4,
  item5,
}

class _profilePublicViewState extends State<profilePublicView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: const BackButton(color: Colors.black87,),
        elevation: 0,
        title: TextWidget(
          text: 'Ezed',
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
            itemBuilder: (context) => const [
              PopupMenuItem(value: MenuItem.item1, child: Text('Remove from search', style: TextStyle(color: Color(0xFFB81F8F), fontWeight: FontWeight.bold),),),
              PopupMenuItem(value: MenuItem.item2, child: Text('Report profile'),),
            ],
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        //padding: const EdgeInsets.only(left: 5, right: 5,),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  child: buildImage(),
                ),
                const Text("Contacts", style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  child: Container(
                    color: Colors.purple[100],
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Image.asset('assets/telephone.png', color: Colors.white, fit: BoxFit.scaleDown,),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Image.asset('assets/facebook.png', color: Colors.white, fit: BoxFit.scaleDown,),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:  Image.asset('assets/whatsapp.png', color: Colors.white, fit: BoxFit.scaleDown,),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Image.asset('assets/instagram.png', color: Colors.white, fit: BoxFit.scaleDown,),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                const Text("About me", style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),),
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: Container(color: Colors.purple[100], height: 120, width: double.infinity,)),


                const SizedBox(height: 25,),

                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  child: buildImage(),
                ),

                const SizedBox(height: 10,),
                const Text("Basics", style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),),
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: Container(color: Colors.purple[100], height: 120, width: double.infinity,)),


                const SizedBox(height: 25,),

                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  child: buildImage(),
                ),

                const SizedBox(height: 10,),
                const Text("Interests", style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),),
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: Container(color: Colors.purple[100], height: 120, width: double.infinity,)),


                const SizedBox(height: 25,),

                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  child: buildImage(),
                ),

                const SizedBox(height: 10,),
                const Text("Looking for", style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),),
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: Container(color: Colors.purple[100], height: 120, width: double.infinity,)),

                const SizedBox(height: 25,),

                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  child: buildImage(),
                ),

                const SizedBox(height: 10,),
                const Text("My Bedroom", style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),),
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: Container(color: Colors.purple[100], height: 120, width: double.infinity,)),


                const SizedBox(height: 50,),
              ],
            ),
          ]
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: (){},
            elevation: 3,
            backgroundColor: const Color(0xFFB81F8F),
            shape:  const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)
              ),
            ),
            child: Image.asset('assets/icons/like.png', color: Colors.white,),
          ),
          FloatingActionButton(
            onPressed: (){},
            elevation: 3,
            backgroundColor: const Color(0xFFB81F8F),
            shape:  const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)
              ),
            ),
            child: Image.asset('assets/icons/chat.png', color: Colors.white,),
          ),
        ],
      ),
    );
    

  }
  Widget buildImage() => Image.network('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80');
}








class myProfilePublicView extends StatefulWidget {
  const myProfilePublicView({Key? key}) : super(key: key);

  @override
  _myProfilePublicViewState createState() => _myProfilePublicViewState();
}


class _myProfilePublicViewState extends State<myProfilePublicView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: const BackButton(color: Colors.black87,),
        elevation: 0,
        title: TextWidget(
          text: 'Username',
          fontSize: 20,
          color: const Color(0xFFB81F8F),
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.white10,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        //padding: const EdgeInsets.only(left: 5, right: 5,),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: buildImage(),
                  ),

                  const SizedBox(height: 10,),
                  const Text("Contacts", style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    child: Container(
                      color: Colors.purple[100],
                      height: 60,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  Image.asset('assets/telephone.png', color: Colors.white, fit: BoxFit.scaleDown,),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  Image.asset('assets/facebook.png', color: Colors.white, fit: BoxFit.scaleDown,),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child:  Image.asset('assets/whatsapp.png', color: Colors.white, fit: BoxFit.scaleDown,),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  Image.asset('assets/instagram.png', color: Colors.white, fit: BoxFit.scaleDown,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text("About me", style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),),
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      child: Container(color: Colors.purple[100], height: 120, width: double.infinity,)),


                  const SizedBox(height: 25,),

                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: buildImage(),
                  ),

                  const SizedBox(height: 10,),
                  const Text("Basics", style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),),
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      child: Container(color: Colors.purple[100], height: 120, width: double.infinity,)),


                  const SizedBox(height: 25,),

                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: buildImage(),
                  ),

                  const SizedBox(height: 10,),
                  const Text("Interests", style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),),
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      child: Container(color: Colors.purple[100], height: 120, width: double.infinity,)),


                  const SizedBox(height: 25,),

                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: buildImage(),
                  ),

                  const SizedBox(height: 10,),
                  const Text("Looking for", style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),),
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      child: Container(color: Colors.purple[100], height: 120, width: double.infinity,)),

                  const SizedBox(height: 25,),

                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    child: buildImage(),
                  ),

                  const SizedBox(height: 10,),
                  const Text("My Bedroom", style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),),
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      child: Container(color: Colors.purple[100], height: 120, width: double.infinity,)
                  ),


                  const SizedBox(height: 50,),
                ],
              ),
            ]
        ),
      ),
    );


  }
  Widget buildImage() => Image.network('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80');
}



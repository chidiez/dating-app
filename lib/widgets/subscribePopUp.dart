import 'package:flutter/material.dart';

import 'buttonWidget.dart';

Widget subscribeButton() {
  return AlertDialog(
    contentPadding: EdgeInsets.zero,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    title: const Center(
      child: Text(
        "Become VIP member",
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w600, color: Color(0xFFB81F8F)),
      ),
    ),
    content: Container(
      width: 550,
      height: 500,
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.purple[400],
            /*child: Carousel(
              images: [
                NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
              ],
            ),*/
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 190,
            width: double.infinity,
            color: Colors.grey[200],
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  hoverColor: Colors.green,
                  onTap: (){
                    print ('working');
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 111,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Image.asset('assets/icons/vip.png', color: Colors.pink[600],),
                            const Text('Lifetime', style: TextStyle(color: Colors.black),),
                            const SizedBox(height: 10,),
                            const Text('NGN 9,999', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Container(
                          height: 22,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          child: Center(child: Text('No Subscriptions', style: TextStyle(color: Colors.white, fontSize: 12),)),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                        height: 150,
                        width: 111,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('1', style: TextStyle(fontSize: 45, fontWeight: FontWeight.w500),),
                            Text('month'),
                            SizedBox(height: 10,),
                            Text('NGN 1,000', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
                          ],
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 111,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink[600],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('6', style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.w500),),
                          Text('months', style: TextStyle(color: Colors.white),),
                          SizedBox(height: 10,),
                          Text('NGN 4,200', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: Container(
                        height: 20,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: Center(child: Text('Most Popular', style: TextStyle(color: Colors.white, fontSize: 12),)),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Container(
                        height: 20,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: Center(child: Text('Save 30%', style: TextStyle(color: Colors.white, fontSize: 12),)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15,),
            child: ButtonWidget (
              onPressed: () {},
              text: 'Continue',
            ),
          ),
          TextButton(
            onPressed: () {
              //Navigator.pop(context);
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              //highlightColor: Colors.transparent,
            ),
            child: const Text(
              'Not now',
              style: TextStyle(
                  color: Colors.black, decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    ),
  );
}


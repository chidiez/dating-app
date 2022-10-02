import 'package:flutter/material.dart';
import 'package:vanilla/screens/mainPage/explore.dart';
import 'package:vanilla/screens/mainPage/favourites.dart';
import 'package:vanilla/screens/mainPage/messages.dart';
import 'package:vanilla/screens/mainPage/profile.dart';

class BottomNav extends StatefulWidget {
  static String routeName = '/bottom-navigator';
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;
  final screens = [
    const ExploreScreen(),
    const FavouriteScreen(),
    const MessageListScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
    body: IndexedStack(
      index: index,
      children: screens,
    ),
    bottomNavigationBar: NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.white10,
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, fontFamily: 'Proxima Nova',),
        ),
      ),
      child: NavigationBar(
        backgroundColor: Colors.white10,
          height: 55,
          selectedIndex: index,
          onDestinationSelected: (index) =>
              setState(() => this.index = index ),
          destinations: [
            NavigationDestination(
              icon: Image.asset('assets/icons/mexplore.png', color: Colors.black45,),
              selectedIcon: Image.asset('assets/icons/mexplore.png', color: Color(0xFFB81F8F),),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: Image.asset('assets/icons/mlikes.png', color: Colors.black45,),
              selectedIcon: Image.asset('assets/icons/mlikes.png', color: Color(0xFFB81F8F),),
              label: 'Favourites',
            ),
            NavigationDestination(
              icon: Image.asset('assets/icons/mchat.png', color: Colors.black45,),
              selectedIcon: Image.asset('assets/icons/mchat.png', color: const Color(0xFFB81F8F),),
              label: 'Messages',
            ),
            NavigationDestination(
              icon: Image.asset('assets/icons/mprofile.png', color: Colors.black45,),
              selectedIcon: Image.asset('assets/icons/mprofile.png', color: const Color(0xFFB81F8F),),
              label: 'Profile',
            ),
            /* const NavigationDestination(
              icon: CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
              ),
              //selectedIcon: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
              label: 'Profile',
            ), */
          ]
      ),
    ),
  );
}


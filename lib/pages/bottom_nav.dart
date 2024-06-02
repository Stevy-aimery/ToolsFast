import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:toolsfast/pages/home.dart';
import 'package:toolsfast/pages/order copy.dart';
import 'package:toolsfast/pages/profile.dart';
import 'package:toolsfast/pages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Home homePage;
  late Profile profilePage;
  late Order orderPage;
  late Wallet walletPage;

  @override
  void initState() {
    homePage = Home();
    orderPage = Order();
    profilePage = Profile();
    walletPage = Wallet();
    pages = [homePage, orderPage, walletPage, profilePage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Color.fromRGBO(115, 60, 71, 1),
        animationDuration: Duration(milliseconds: 400),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.account_balance_wallet_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
        ],
      ),
      body: IndexedStack(
        index: currentTabIndex,
        children: pages,
      ),
    );
  }
}

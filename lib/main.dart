import 'package:e_commerce_provider/provider/cart_provider.dart';
import 'package:e_commerce_provider/screens/cart_details_screen.dart';
import 'package:e_commerce_provider/screens/favorite_screen.dart';
import 'package:e_commerce_provider/screens/home_screen.dart';
import 'package:e_commerce_provider/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/favorite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List screens = [
    const HomeScreens(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("E-Commerce App"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CartDetailsScreen();
                }));
              },
              icon: const Icon(Icons.add_shopping_cart_rounded))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile"),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}

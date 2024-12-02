import 'package:flutter/material.dart';
import 'package:wisata_candi/screens/favorite_screen.dart';
import 'package:wisata_candi/screens/home_screen.dart';
import 'package:wisata_candi/screens/profil_screen.dart';
import 'package:wisata_candi/screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screenOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfilScreen()
    


  ];
  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem> [
        //item pertama 
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        // item kedua 
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        // item ketiga 
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        // item keemopat
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.deepPurple.shade200,

      ),
    );
  }
}
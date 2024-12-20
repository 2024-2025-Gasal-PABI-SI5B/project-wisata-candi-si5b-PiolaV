import 'package:wisata_candi/screens/favorite_screen.dart';
import 'package:wisata_candi/screens/home_screen.dart';
import 'package:wisata_candi/screens/profil_screen.dart';
import 'package:wisata_candi/screens/search_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainScreen(),
     
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    int _selectedIndex = 0;

    static const List<Widget> _screenOptions = <Widget>[
        HomeScreen(),
        SearchScreen(),
        FavoriteScreen(),
        ProfilScreen()
        
    ];

    void _onItemtapped(int index){
        setState(() {
          _selectedIndex = index;
        });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screenOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem> [
                //item Pertama
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                //item kedua
                BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
                //item ketiga
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
                //item keempat
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemtapped,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.deepPurple.shade200,

        ),
    );
  }
}
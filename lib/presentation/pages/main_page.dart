import 'package:flutter/material.dart';
import '../pages/matching/matching_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MatchingPage(),
    const Center(child: Text('Create'),),
    const Center(child: Text('Universe'),),
    const Center(child: Text('Messages'),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Cocok',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Buat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Alam Semesta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Pesan',
          ),
        ],
      ),
    );
  }
}

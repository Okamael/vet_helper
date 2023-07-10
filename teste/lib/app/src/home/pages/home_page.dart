
import 'package:flutter/material.dart';
import 'package:teste/app/src/dosagem/page/dosagem_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Vet Helper homa page'),
        
      ),
      body: _selectedIndex == 0 ? Stack(
        children: [
          
           Image.asset('assets/images/OIG.jfif', height: MediaQuery.sizeOf(context).height, width: MediaQuery.sizeOf(context).width, fit: BoxFit.cover,)

        ],
        
      ):Container(
        child: DosagemPage()),
      

      bottomNavigationBar:BottomNavigationBar(
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(icon:Icon(Icons.pets), label: 'Calcula dosagem', ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ) ,
    );
  }
}
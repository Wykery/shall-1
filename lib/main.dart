import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shall/pages/home.dart';
import 'package:shall/pages/outifit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Coolvetica',
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color.fromARGB(255, 255, 255, 255),
          onPrimary: Color.fromARGB(255, 0, 0, 0),
          secondary: Color.fromARGB(255, 0, 0, 0),
          onSecondary: Color.fromARGB(255, 0, 0, 0),
          error: Colors.orange,
          onError: const Color(0xFFFFFFFF),
          background: Color.fromARGB(255, 255, 255, 255),
          onBackground: Color.fromARGB(255, 0, 0, 0),
          surface: Color.fromARGB(255, 255, 255, 255),
          onSurface: Color.fromARGB(255, 0, 0, 0),
        )
      ),
      home: MainApp()
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() =>
      _MainAppState();
}

class _MainAppState
    extends State<MainApp> {
  int _selectedIndex = 0;
    static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    outfitChoicePage()
  ];
  static List<AppBar> _appBarOptions = [
    appBar("Home"),
    appBar("Cards"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(),
        appBar: _appBarOptions.elementAt(_selectedIndex),
        floatingActionButton: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
          width: 400,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => outfitChoicePage())
              );
            },
            isExtended: true,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero) ,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Icon(Icons.add, size: 40,)),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: _widgetOptions.elementAt(_selectedIndex),
      );
  }

  static appBar(String text) {
    return AppBar(
      title: Text(text, style: TextStyle(fontFamily: 'Coolvetica', fontWeight: FontWeight.w800, fontSize: 30, color: Colors.black),),
      centerTitle: true,
      elevation: 0,
      actions: [
          GestureDetector(
            onTap: () {
              print("test1");
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width: 37,
              height: 37,
              child: Icon(Icons.account_circle_outlined),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("test2");
            },

            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width: 37,
              height: 37,
              child: Icon(Icons.find_replace),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("test3");
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width: 37,
              height: 37,
              child: Icon(Icons.favorite),
            ),
          ),
      ],
    );
  }

  Drawer drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height:100,),
          makeListTile("Female", Icons.woman),
          makeListTile("Male", Icons.man),
          makeListTile("Kids", Icons.child_care),
          makeListTile("Accesories", Icons.earbuds),
          SizedBox(height: 300),
          makeTextButton("Support"),
          makeTextButton("Products and quality"),
          makeTextButton("Delivery"),
          makeTextButton("Contacts"),
          makeTextButton("Legal information")
        ],
      )
    );
  }


  GestureDetector makeTextButton(String text) {
    return GestureDetector(
      onTap: () => print(text),
      child: Container(
        padding: EdgeInsets.only(left: 20),
        child: Text(
        text, 
        style: TextStyle(
          fontSize: 16,
          decoration: TextDecoration.underline
            ),
          ),
      ),
    );
  }
  
  GestureDetector makeListTile(String text, IconData icon) {
    return GestureDetector(
      onTap: () => print(text),
      child: ListTile(
        title: Row(
          children: [
            Icon(icon),
            SizedBox(width: 30,),
            Text(text)
          ],
        ),
      ),
    );
  }
}
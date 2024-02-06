import 'package:flutter/material.dart';
import 'package:shall/app_bar.dart';
import 'package:shall/pages/home.dart';
import 'package:shall/pages/cards.dart';

void main() {
  runApp(const MainApp());
}

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'Rubik',
//         colorScheme: ColorScheme(
//           brightness: Brightness.dark,
//           primary: const Color.fromRGBO(102, 187, 106, 1),
//           onPrimary: const Color(0xFFFFFFFF),
//           secondary: const Color.fromRGBO(129, 199, 132, 1),
//           onSecondary: const Color(0xFFFFFFFF),
//           error: Colors.orange,
//           onError: const Color(0xFFFFFFFF),
//           background: const Color.fromRGBO(66, 66, 66, 1),
//           onBackground: const Color(0xFFFFFFFF),
//           surface: const Color.fromRGBO(76, 175, 80, 1),
//           onSurface: const Color(0xFFFFFFFF),
//         )
//       ),
//       home: Scaffold(
//         appBar: appBar(),
//         body: ,
//       )
//     );
//   }
// }

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
    CardsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Rubik',
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: const Color.fromRGBO(102, 187, 106, 1),
          onPrimary: const Color(0xFFFFFFFF),
          secondary: const Color.fromRGBO(129, 199, 132, 1),
          onSecondary: const Color(0xFFFFFFFF),
          error: Colors.orange,
          onError: const Color(0xFFFFFFFF),
          background: const Color.fromRGBO(66, 66, 66, 1),
          onBackground: const Color(0xFFFFFFFF),
          surface: const Color.fromRGBO(76, 175, 80, 1),
          onSurface: const Color(0xFFFFFFFF),
        )
      ),
      home: Scaffold(
        appBar: appBar(),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: navigationBar(),
      ),
    );
  }

  BottomNavigationBar navigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card),
          label: "Cards",
        )
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
import 'package:covid_19_track/screens/MyHomePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Track codis-19",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: new MyHomePage(),
      // onGenerateRoute: (RouteSettings settings) {
      //   switch (settings.name) {
      //     case '/login':
      //       return new MyCustomRoute(
      //         builder: (_) => new LoginPage(),
      //         settings: settings,
      //       );
      //     case '/mapt':
      //       return new MyCustomRoute(
      //         builder: (_) => new CaskyMap(),
      //         settings: settings,
      //       );
      //     case '/profile':
      //       return new MyCustomRoute(
      //         builder: (_) => new Profile(),
      //         settings: settings,
      //       );
      //     case '/chat':
      //       return new MyCustomRoute(
      //         builder: (_) => new Chat(),
      //         settings: settings,
      //       );
      //   }
      // },
    );
  }
}

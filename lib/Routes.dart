import 'package:covid_19_track/screens/MyHomePage.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Track codis-19",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
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

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  // @override
  // Widget buildTransitions(BuildContext context, Animation<double> animation,
  //     Animation<double> secondaryAnimation, Widget child) {
  //   if (settings.isInitialRoute) return child;
  //   return new FadeTransition(opacity: animation, child: child);
  // }
}

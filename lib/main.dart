import 'package:flutter/material.dart';
import 'charts.dart' show PointsLineChart;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          backgroundColor: const Color(0xff151c23)),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    Widget current = const Text("test");
    switch (index) {
      case 0:
        current = const Page1();

        break;
      case 1:
        current = const Page2();
        break;
      case 2:
        current = SizedBox(
          height: 300,
          child: Card(
            color: const Color(0xff212b36),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: PointsLineChart.withSampleData(),
            ),
          ),
        );
        break;
      case 3:
        current = const Text("page4");
        break;
    }
    return Scaffold(
      backgroundColor: const Color(0xff151c23),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newIndex) {
          setState(() {
            index = newIndex;
          });
        },
        unselectedItemColor: const Color(0xff919eab),
        backgroundColor: const Color(0xff212b36),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: (index == 0)
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined),
              label: "Home"),
          BottomNavigationBarItem(
              icon: (index == 1)
                  ? const Icon(Icons.analytics)
                  : const Icon(Icons.analytics_outlined),
              label: "Analytics"),
          BottomNavigationBarItem(
              icon: (index == 2)
                  ? const Icon(Icons.settings)
                  : const Icon(Icons.settings_outlined),
              label: "Settings")
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        title: Row(children: const [
          Icon(Icons.shopify_sharp),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("DUKAN"),
          )
        ]),
        backgroundColor: const Color(0xff151c23),
      ),
      body: Center(
        child: current,
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [MyCard(), MyCard(), MyCard()],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [MyCard(), MyCard()],
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: SizedBox(
          height: 280,
          child: Card(
            elevation: 10,
            color: Color(0xff212b36),
            child: Center(
              child: Text(
                "Page1",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )),
    );
  }
}

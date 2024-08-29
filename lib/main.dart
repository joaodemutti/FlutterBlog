import 'package:a0/pages/home.dart';
import 'package:a0/widgets/topbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          error: Colors.red,
          onError: Colors.white,
          primary: Colors.grey,
          onPrimary: Colors.white,
          secondary: Colors.black,
          onSecondary: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black
          ),
        useMaterial3: true,
      ),
      home: const Layout(title: 'Usuário'),
    );
  }
}

class Layout extends StatefulWidget {
  const Layout({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _index = 0;
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(context, widget.title),

      body: PageView(onPageChanged: (value) => setState(() {
        _index=value;
      }),
      controller: _controller,
      children: [
        HomePage(),
        Center(child:Icon(Icons.camera)),
        Center(child:Icon(Icons.person))
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(currentIndex: _index,
      selectedItemColor: Colors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline),label:'Post'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label:'Profile')
      ],
      onTap: (value) => setState(() {
        _controller.animateToPage(value,
        curve: Curves.easeInOut,
        duration: Duration(
          milliseconds: (_index==0&&value==2)||(_index==2&&value==0)?600:400
          ));
        _index = value;
      })),
      endDrawer: Drawer(),
    );
  }
}

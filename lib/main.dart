import 'package:flutter/material.dart';
import 'package:untitled/ui/home_page.dart';
import 'package:flutter/services.dart';
import 'package:untitled/ui/search_page.dart';

void main() {
  runApp(const MyApp());

  SystemUiOverlayStyle systemUiOverlayStyle =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      title: '目光资讯',
      theme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue),
      home: const MyHomePage(title: '目光资讯'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((states) {
        if (states == AnimationStatus.completed) {
          controller.reverse();
        } else if (states == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    Text('页面 2'),
    Text('页面 3'),
    Text('页面 4'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(widget.title),
            mySearch(),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('礼物'),
                      content: Text('领取成功'),
                      actions: [
                        TextButton(
                          onPressed: () {

                            Navigator.of(context).pop();
                          },
                          child: Text('收到啦！'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                child: RotationTransition(
                  turns: animation,
                  child: Image.asset(
                    "assets/images/fg_my_daily_benefits.png",
                    height: 22,
                    width: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '搜索',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '设置',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  mySearch() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            color: Colors.white),
        height: 38,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 15, left: 15, bottom: 15, top: 12),
        child: GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          },
          child: Row(
            children: <Widget>[
              const Text("\t"),
              Image.asset(
                "assets/images/ic_home_seek.png",
                height: 14,
                width: 14,
              ),
              const Text(
                "\t\t\t搜索你感兴趣的内容",
                style: TextStyle(fontSize: 13, color: Color(0xff999999)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:untitled/ui/home_page_child.dart';
import 'package:untitled/ui/search_page.dart';
import 'package:untitled/util/AppUtils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabTitles = AppUtil.tabTitles;

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabTitles.length, vsync: this);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _tabTitles.map((title) => NewsPage()).toList(),
            ),
          ),
        ],
      ),
    );
  }


  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("目光资讯"),
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
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                indicatorPadding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                // replace with desired spacing
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
                //是否可以滚动
                isScrollable: true,
                tabs: _tabTitles.map((title) => Tab(text: title)).toList(),
              ),
            ),
            SizedBox(
              width: 43,
              child: ColorFiltered(
                colorFilter:
                const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                child: Image.asset(
                  "assets/images/ic_more.png",
                  height: 14,
                  width: 12,
                ),
              ),
            ),
          ],
        ),
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
          onTap: () {
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

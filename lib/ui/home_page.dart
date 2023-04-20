import 'package:flutter/material.dart';
import 'package:untitled/ui/home_page_child.dart';
import 'package:untitled/util/AppUtils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabTitles = AppUtil.tabTitles;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabTitles.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
}

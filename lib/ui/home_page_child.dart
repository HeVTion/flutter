import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:untitled/ui/details.dart';
import 'package:untitled/util/AppUtils.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  Page createState() => Page();
}

class Page extends State<NewsPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;
    return myPage();
  }

  ///每一个页面
  myPage() {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemBuilder: (BuildContext context, int i) {
        return Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: itemType(i % 5),
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15));
      },
      itemCount: 40,
    );
  }

  itemType(int content) {
    switch (content) {
      case 0:
        return marqueeTextItem(); //纯文本

      case 1: //上面三图下文字
        return bannerItem();

      case 2: //左文右图
        return imageText3Item();

      case 3:
        return textItem();

      case 4:
        return imageText2Item();
    }
  }

  imageText3Item() {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsDetails()),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
              "特斯拉车主：我现在停个车都担心要赔得倾家荡产",
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Image.network(AppUtil.tesla),
                  ),
                  Container(
                    width: 3,
                  ),
                  Flexible(
                    flex: 1,
                    child: Image.network(AppUtil.tesla),
                  ),
                  Container(
                    width: 3,
                  ),
                  Flexible(
                    flex: 1,
                    child: Image.network(AppUtil.tesla),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFF757575),
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  imageText2Item() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsDetails()),
        );
      },
      child: Column(
        children: <Widget>[
          //左文右图
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  "习近平总书记在党建工作会议上的重要讲话视野宏阔、总揽全局",
                  style: AppUtil.tStyle,
                ),
              ),
              Image.network(
                AppUtil.xidd,
                fit: BoxFit.fill,
                height: 94,
                width: 133,
              ),
            ],
          ),

          const Padding(padding: EdgeInsets.only(top: 15)),

          const Divider(
            color: Color(0xFF757575),
            height: 30,
          ),
        ],
      ),
    );
  }

  textItem() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsDetails()),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "深入学习习近平总书记在中央和国家机关党的建设工作会议重要讲话之三",
            style: AppUtil.tStyle,
          ),
          const SizedBox(height: 5),
          const Text(
            "永恒的初心 听习近平讲述自己的故事,河南复读女孩高考超一本线32分 志愿被同学恶意填成北大",
            style: TextStyle(
                fontSize: 17, color: Colors.grey, fontWeight: FontWeight.w600),
          ),
          const Divider(
            color: Color(0xFF757575),
            height: 30,
          )
        ],
      ),
    );
  }

  List<BannerModel> listBanners = [
    BannerModel(id: "1", imagePath: AppUtil.imageUrl),
    BannerModel(id: "2", imagePath: AppUtil.imageUrl),
    BannerModel(id: "3", imagePath: AppUtil.imageUrl),
    BannerModel(id: "4", imagePath: AppUtil.imageUrl),
  ];

  bannerItem() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: listBanners,
    );
  }

  marqueeTextItem() {
    return Column(
      children: const [
        TextScroll(
          '深入学习习近平总书记在中央和国家机关党的建设工作会议重要讲话之三,'
          '澎湃新闻评论：山大或许有委屈，但真的该反思“学伴”制度了',
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        TextScroll(
          '快递小哥一万多元茅台酒被偷 民警：你自己丢的东西自己负责'
          '飞身跳船敲舱门！美国特战队员武力拦截半潜船，搜出近8吨毒品',
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

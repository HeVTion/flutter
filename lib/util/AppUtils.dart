import 'package:flutter/material.dart';

class AppUtil {
  ///资源文件
  static String imageUrl =
      "https://img1.baidu.com/it/u=413643897,2296924942&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500";

  static String tesla =
      "https://img.pcauto.com.cn/images/ttauto/2022/08/05/7127624801107313188/b5426e6cf9f949718506d720041b6620.png";
  static String tesla4 = "https://photocdn.sohu.com/20160508/Img448319654.jpg";

  static String tesla2 =
      "https://pic1.hebei.com.cn/003/021/593/00302159323_ec7f4791.gif";
  static String tesla3 =
      "https://img.mp.itc.cn/upload/20170811/b1bbf7c8845343948ab22f71c2235798_th.jpg";

  static String xidd =
      "https://p2.cri.cn/M00/20/64/CqgNOlaGPHaANt5lAAAAAAAAAAA172.550x392.jpg";

  static String splash1 =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1563951776&di=991c3fb2c1e501b0cb88bdf45c032ea0&src=http://img.zcool.cn/community/01e2a9583e9e7ba8012060c8f9fc3a.jpg@2o.jpg";
  static String splash2 =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1563951893&di=6ffb2eee15547b560f0f21e1f00da08f&src=http://b-ssl.duitang.com/uploads/item/201608/26/20160826065616_CsP4B.thumb.700_0.jpeg";

  ///文字样式
  static TextStyle tStyle = const TextStyle(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600);

  ///数据
  static List<HomeModel> myData = [
    HomeModel("特斯拉车主：我现在停个车都担心要赔得倾家荡产", imageUrl),
    HomeModel("习近平总书记在党建工作会议上的重要讲话视野宏阔、总揽全局", imageUrl),
    HomeModel("永恒的初心 听习近平讲述自己的故事", imageUrl),
    HomeModel("深入学习习近平总书记在中央和国家机关党的建设工作会议重要讲话之三", imageUrl),
    HomeModel("上半年我国实际使用外资增长7.2％", imageUrl),
    HomeModel("追踪：杭州9岁女童被租客带走 仍未找到", imageUrl),
    HomeModel("澎湃新闻评论：山大或许有委屈，但真的该反思“学伴”制度了", imageUrl),
    HomeModel("河南复读女孩高考超一本线32分 志愿被同学恶意填成北大", imageUrl),
    HomeModel("快递小哥一万多元茅台酒被偷 民警：你自己丢的东西自己负责", imageUrl),
    HomeModel("飞身跳船敲舱门！美国特战队员武力拦截半潜船，搜出近8吨毒品", imageUrl)
  ];

  final List<String> imgList = [
    AppUtil.imageUrl,
    AppUtil.imageUrl,
    AppUtil.imageUrl,
    AppUtil.imageUrl,
  ];

  static String videoUrl =
      "https://www.douyin.com/aweme/v1/play/?video_id=v0200fg10000cfqt4ebc77u7fguo8u70&line=0&file_id=e84f603680e34e99b56a008862587691&sign=15fc1b9ca23d68a7eccba6b2bcee4714&is_play_url=1&source=PackSourceEnum_AWEME_DETAIL&aid=6383";
  static String videoUrl1 =
      "https://pubmeizi.daishan.com/10787263780164_hd.mp4?width=404&height=720&isVertical=1&fsize=7656458&duration=23.0";
  static String videoUrl2 =
      "https://www.douyin.com/aweme/v1/play/?video_id=v0200fc10000bq7900c1n3e8es2p1440&line=0&file_id=8619203d091243669f711ff7b767e2e7&sign=4adace51ab34def65431b8c5d0fc4a60&is_play_url=1&source=PackSourceEnum_SEARCH&aid=6383";

  static final List<String> videoUrls = [
    videoUrl,
    "https://mc-public-test.tmuyun.com/10157627321604_or.mp4?width=320&height=568&isVertical=0&fsize=189388&duration=4.0",
    videoUrl,
  ];

  static List<String> tabTitles = [
    '推荐',
    '热门',
    '新闻',
    '杭州',
    '科技',
    '推荐',
    '热门',
    '新闻',
    '杭州',
    '科技',
    '推荐',
    '热门',
    '新闻',
    '杭州',
    '科技',
  ];
}

class HomeModel {
  String title;
  String url;

  HomeModel(this.title, this.url);
}

import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MinePage();
  }
}

class _MinePage extends State<MinePage>
    with AutomaticKeepAliveClientMixin<MinePage> {
  var gray_99 = 0xff999999;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: 310,
          child: Stack(
            children: <Widget>[
              topBar(),
              Positioned(
                top: 170,
                left: 10,
                child: Card(
                  elevation: 20.0,
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width - 30,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "任务中心",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.black),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "做任务赚经验",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff999999)),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "积分商城",
                                style: TextStyle(
                                    fontSize: 19, color: Colors.black),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "赚积分换大礼",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff999999)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        _bottomList("传播引导", ""),
        _bottomList("我的帖子", ""),
        _bottomList("历史浏览", ""),
        _bottomList("关于我们", ""),
        _bottomList("联系我们", ""),
      ],
    );
  }

  _bottomList(String title, String subTitle, {bool b = false}) {
    return GestureDetector(
      onTap: () {
        if (title == "邀请好友") {}
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/fg_my_daily_benefits.png",
              height: 22,
              width: 22,
            ),
            Text(
              "\t\t$title",
              style: TextStyle(fontSize: 16),
            ),
            Expanded(flex: 1, child: Text("")),
            Text(
              subTitle,
              style: TextStyle(fontSize: 12, color: Color(gray_99)),
            ),
            if (b)
              Image.asset(
                "assets/images/fg_my_red_wallet.png",
                height: 16,
                width: 18,
              ),
            Icon(
              Icons.chevron_right,
              color: Color(gray_99),
            ),
          ],
        ),
      ),
    );
  }

  Container topBar() {
    return Container(
      padding: EdgeInsets.only(right: 15, left: 15),
      height: 220,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 10,
            top: 50,
            child: ColorFiltered(
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              child: Image.asset("assets/images/fg_my_header_setting_btn.png",
                  width: 28, height: 28),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    "assets/other/tutu.png",
                    height: 62,
                    width: 62,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: 62,
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "何同学，你好",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Image.asset(
                              "assets/images/fg_my_header_unbinding_mobile.png",
                              height: 22,
                              width: 22,
                            ),
                            Text("\t\t"),
                            Image.asset(
                              "assets/images/fg_my_header_unbinding_wxchat.png",
                              height: 22,
                              width: 22,
                            ),
                            Text("\t\t"),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              child: Container(
                                alignment: AlignmentDirectional.center,
                                height: 22,
                                width: 108,
                                color: Colors.white,
                                child: Text(
                                  "绑定微信",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

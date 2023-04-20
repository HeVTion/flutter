import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("新闻详情"),
      ),
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
              url: Uri.parse(
                  "https://appshare.daishan.com/webDetails/news?id=3388143&tenantId=27&uid=64351dcec790b0329a70c0fe")),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

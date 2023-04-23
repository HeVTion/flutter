import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  State<StatefulWidget> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("社区"),
      ),
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
              url: Uri.parse(
                  "https://preapp.tmuyun.com/webForum/homepage?tenantId=1&post=1&search=1&category=1&nossr=1")),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

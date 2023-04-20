import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/util/AppUtils.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('搜索'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: '搜索你赶兴趣的内容',
              prefixIcon: Icon(Icons.search),
            ),
            onSubmitted: (query) {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 16),
          const Text('热门搜索'),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: AppUtil.myData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(AppUtil.myData[index].title),
                  onTap: () {
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

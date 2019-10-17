import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_appbar.dart';

class ContentPager extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final ContentPagerController contentPagerController;

  const ContentPager({Key key, this.onPageChanged, this.contentPagerController}) : super(key: key);

  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {

  PageController _pageController = PageController(
    //视图比例
    viewportFraction: 0.8,
  );

  static List<Color> _colorList = [
    Colors.blue,
    Colors.red,
    Colors.deepPurple,
    Colors.teal
  ];

  Widget _wrapItem(int index){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color:_colorList[index],
        ),
      ),
    );
  }

  @override
  void initState() {
    if(widget.contentPagerController != null){
      widget.contentPagerController._pageController = _pageController;
    }
    _statusBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomAppBar(),
        Expanded(//高度撑开，否则在Column中没有高度会报错
          child: PageView(
            onPageChanged: widget.onPageChanged,
            children: <Widget>[
              _wrapItem(0),
              _wrapItem(1),
              _wrapItem(2),
              _wrapItem(3),
            ],
            controller: _pageController,
          ),
        )
      ],
    );
  }
  
  //状态栏样式，沉浸式状态栏
  _statusBar(){
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);
  }
}

//内容区域控制器
class ContentPagerController{
  PageController _pageController;

  void jumpToPage(int page){
    //防止空指针异常，?.
    _pageController?.jumpToPage(page);
  }
}
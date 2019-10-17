import 'package:flutter/material.dart';

//底部导航框架
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;//当前选中的index

  //底部Tab
  _bottomItem(String title,IconData icon,int index){
    return BottomNavigationBarItem(
      icon: Icon(icon,color: _defaultColor,),//未选中时
      activeIcon: Icon(icon,color: _activeColor,),//选中时
      title: Text(title,style: TextStyle(color: index==_currentIndex?_activeColor:_defaultColor),)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffedeef0),Color(0xffede7e9)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          ),
        ),
        child: Center(
          child: Text("你点击了第$_currentIndex个tab",style: TextStyle(fontSize: 36,color: Colors.blue),),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          //修改选中索引状态
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,//文字固定，永远出现在底部
        items: [
          _bottomItem("本周",Icons.folder,0),
          _bottomItem("分享",Icons.explore,1),
          _bottomItem("免费",Icons.donut_small,2),
          _bottomItem("长安",Icons.person,3),
        ],
      ),
    );
  }
}

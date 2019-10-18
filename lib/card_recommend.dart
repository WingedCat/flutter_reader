import 'package:flutter/material.dart';
import 'base_card.dart';

//本周推荐卡片
class CardRecommend extends BaseCard{

  @override
  _CardRecommendState createState() =>_CardRecommendState();
}

class _CardRecommendState extends BaseCardState{
  @override
  void initState() {
    subTitleColor = Color(0xffb99444);
    super.initState();
  }

  @override
  topTitle(String topTitle) {
    return super.topTitle("本周推荐");
  }

  @override
  subTitle(String title) {
    return super.subTitle("送你一天无限卡-全场书籍免费阅读");
  }

  @override
  bottomContent() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Image.network("http://www.devio.org/io/flutter_beauty/card_1.jpg",fit: BoxFit.cover,),
      ),
    );
  }


}


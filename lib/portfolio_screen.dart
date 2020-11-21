import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helper_widgets/empty_space.dart';
import 'package:spending_tracker/widgets/base_appbar.dart';
import 'package:spending_tracker/widgets/custom_measure_chart.dart';

import 'app_colors.dart';
import 'main.dart';

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      backgroundColor: AppColors.colorBg0,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 31),
                  child: Text("My Portfolio",
                      style: TextStyle(
                          color: AppColors.colorText0,
                          fontSize: 18,
                          fontFamily: 'TitilliumWeb')),
                ),
                EmptySpace.v2(),
                Padding(
                  padding: EdgeInsets.only(left: 31),
                  child: Text("Overview",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontFamily: 'TitilliumWeb')),
                ),
                EmptySpace(),
                Container(
                    color: AppColors.colorBg0,
                    height: 230,
                    padding: EdgeInsets.all(8.0),
                    child: CustomMeasureTickCount.withSampleData()),
                EmptySpace.v3(),
                Padding(
                  padding: EdgeInsets.only(left: 31),
                  child: Text("Stocks",
                      style: TextStyle(
                          color: AppColors.colorText0,
                          fontSize: 18,
                          fontFamily: 'TitilliumWeb')),
                ),
                EmptySpace(),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    assetItem('images/arla.png', "Arla Food Inc.",
                        'FMCG / Conglomerate'),
                    assetItem('images/9mobile.png', "9mobile",
                        'Telecommunication / ISP'),
                    assetItem('images/airtel.png', "Airtel Nigeria",
                        'Telecommunication / ISP'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget assetItem(String img, String title, String subTitle) {
  return Card(
    color: AppColors.colorBg0,
    margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
    elevation: 1,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            height: 100,
            width: 90,
            // decoration: BoxDecoration(
            //     color: Colors.lightBlue,
            //     borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('$img', package: App.pkg),
            )),
        EmptySpace.h2(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("$title",
                  style: TextStyle(
                      color: AppColors.colorText0,
                      fontSize: 20,
                      fontFamily: 'TitilliumWeb')),
              Text("$subTitle",
                  style: TextStyle(
                      color: AppColors.colorText2,
                      fontSize: 12,
                      fontFamily: 'TitilliumWeb')),
            ],
          ),
        )
      ],
    ),
  );
}

class ListIcon extends StatelessWidget {
  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Image.asset('images/profile.png', package: App.pkg),
    );
  }
}

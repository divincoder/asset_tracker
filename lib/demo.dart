import 'package:flutter/material.dart';
import 'package:spending_tracker/auth/login_screen.dart';
import 'package:spending_tracker/portfolio_screen.dart';
import 'package:spending_tracker/spending_income_expenses_header.dart';

import 'app_colors.dart';
import 'chart/chart.dart';
import 'components/profile_icon.dart';
import 'components/scaling_info.dart';
import 'demo_data.dart';
import 'interact_notification.dart';
import 'spending_app_bar.dart';
import 'spending_category_list.dart';
import 'spending_date_range.dart';
import 'spending_graph.dart';

class SpendingTrackerDemo extends StatefulWidget {
  @override
  _SpendingTrackerDemoState createState() => _SpendingTrackerDemoState();
}

class _SpendingTrackerDemoState extends State<SpendingTrackerDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Chart _chart;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    var data = ChartData();
    _chart = Chart([data.dataSet1, data.dataSet2], '', '\$');
    _chart.domainStart = 0;
    _chart.domainEnd = 13;
    _chart.rangeStart = 0;
    _chart.rangeEnd = 8;
    _chart.selectedDataPoint = 4;
    _chart.addListener(() => setState(() {}));
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 12000),
        upperBound: _chart.maxDomain);

    _controller.addListener(() {
      final d = _controller.value - _chart.domainStart;
      if (d < 0) {
        _chart.domainStart += d;
        _chart.domainEnd += d;
      } else {
        _chart.domainEnd += d;
        _chart.domainStart += d;
      }
    });

    super.initState();
  }

  @override
  Widget build(context) {
    if (!ScalingInfo.initialized) {
      ScalingInfo.init(context);
    }

    return Scaffold(
        key: scaffoldKey,
        appBar: SpendingAppBar(scaffoldKey: scaffoldKey),
        drawer: Drawer(
            child: Container(
          color: AppColors.colorBg0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 100),
              Container(height: 150, child: ProfileIcon()),
              Text('Ofoegbu Valentine',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.colorText2,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  )),
              SizedBox(height: 40),
              ListTile(
                leading: Icon(Icons.insert_chart, color: AppColors.colorText1),
                title: Text('My Portfolio',
                    style: TextStyle(
                      color: AppColors.colorText1,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    )),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PortfolioScreen()));

                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: AppColors.colorText1),
                title: Text('Settings',
                    style: TextStyle(
                      color: AppColors.colorText1,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.power_settings_new, color: AppColors.colorText1),
                title: Text('Log Out',
                    style: TextStyle(
                      color: AppColors.colorText1,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    )),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        )),
        body: Container(
          color: AppColors.colorBg0,
          child: Column(
            children: [
              NotificationListener<InteractNotification>(
                onNotification: _handleInteract,
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Top area with text fields and income/expense summary
                      SpendingIncomeExpensesHeader(chart: _chart),
                      Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              SpendingGraph(chart: _chart),
                              SizedBox(height: 24),
                              SpendingDateRange(chart: _chart),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SpendingCategoryList(updateNotifier: _chart),
            ],
          ),
        ));
  }

  bool _handleInteract(InteractNotification notification) {
    if (notification.end) {
      _controller.value = _chart.domainStart;
      double target = _chart.domainStart.round().toDouble();
      _controller.animateTo(target, curve: Curves.easeIn);
    } else {
      //_controller.stop();
    }
    return false;
  }
}

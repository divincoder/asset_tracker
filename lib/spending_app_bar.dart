import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'components/header_row.dart';
import 'components/profile_icon.dart';

class SpendingAppBar extends StatelessWidget with PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  SpendingAppBar({this.scaffoldKey, Key key}) : super(key: key);

  @override
  Widget build(context) {
    return Container(
      height: preferredSize.height,
      color: AppColors.colorBg1,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
              child: InkWell(
                onTap: () {
                  scaffoldKey.currentState.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            HeaderRow(),
            Container(height: 70, child: ProfileIcon()),
          ],
        ),
      ),
    );
  }

  Size get preferredSize => Size(double.infinity, 88);
}

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

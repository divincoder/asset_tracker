import 'package:flutter/material.dart';
import 'package:spending_tracker/app_colors.dart';

class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  BaseAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _BaseAppBarState createState() => _BaseAppBarState();
}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.arrow_back, size: 30,),
            color: AppColors.colorText1,
            onPressed: () => Navigator.of(context).pop(true),
          ); //
        },
      ),
      actions: <Widget>[
        // Container(
        //   margin: EdgeInsets.only(right: 13, left: 13),
        //   height: 40,
        //   width: 40,
        //   child: Transform.scale(
        //     scale: 1,
        //     child: IconButton(
        //         onPressed: null,
        //         icon: Image.asset(
        //             "images/vulte_in_purple_box.png"//"images/polaris-logo.png",
        //         )),
        //   ),
        // ),
      ],
    );
  }
}
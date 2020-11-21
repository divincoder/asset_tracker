import 'package:flutter/material.dart';

import '../app_colors.dart';

class HeaderRow extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
      width: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("FSDH", style: TextStyle(color: Colors.white, fontSize: 17, fontFamily: 'TitilliumWeb')),
          Text("Overview", style: TextStyle(color: AppColors.colorText3, fontSize: 17, fontFamily: 'TitilliumWeb')),
        ],
      ),
    );
  }
}

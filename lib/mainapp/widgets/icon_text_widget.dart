import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  const AppIconText({Key? key,required this.icon,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical:AppLayout.getWidht(12) ,horizontal: AppLayout.getWidht(12)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppLayout.getWidht(5))
      ),
      child: Row(
        children: [
           Icon(icon,
             color: Color(0xFFBFC2DF),
          ),
          Gap(AppLayout.getWidht(10)),
          Text(text,style: Styles.textStyle,)

        ],
      ),
    );
  }
}

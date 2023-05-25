import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginpage/mainapp/screen/upcoming_flights_screen.dart';

import '../utils/app_styles.dart';

class AppDoubleTextWidget extends StatelessWidget {
  final String bigText;
  final String smallText;
  final Widget dir;
  const AppDoubleTextWidget({Key? key, required this.bigText, required this.smallText,required this.dir}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(bigText,style: Styles.headLineStyle2,),
        InkWell(
            onTap: (){
              Get.to(dir);
            },
            child: Text(smallText,style: Styles.textStyle.copyWith(color: Styles.primaryColor)))
      ],
    );
  }
}

import 'package:fashion_shop_girl/src/constants/colors.dart';
import 'package:flutter/material.dart';

class WidgetForAll{
  static Widget radiusButtons(
      {required Icon icon, required VoidCallback ontapAction,Color color=Colors.black12}) {
    return InkWell(
      onTap: ontapAction,
      child: Container(
        width: 40,
        height: 40,
        decoration:
             BoxDecoration(
              color: color,
               shape: BoxShape.circle, 
              ),
        child: icon,
      ),
    );
  } 

}
import 'package:flutter/cupertino.dart';

extension IntExtension on int? {
  int validate({int value = 0}){
    return this ?? value;
  }

  Widget get hs => SizedBox(
    height: this?.toDouble(),
  );

  Widget get ws => SizedBox(
    width: this?.toDouble(),
  );

}
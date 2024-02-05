import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


void navigateAndFinish(
    {required BuildContext context, required Widget widget , required pageTransitionType }) {
  Navigator.pushAndRemoveUntil(context,
      PageTransition(type: pageTransitionType , child: widget), (route) => false);
}
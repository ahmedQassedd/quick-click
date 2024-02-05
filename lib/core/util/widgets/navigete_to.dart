import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void navigateTo({required BuildContext context, required Widget widget , pageTransitionType}) =>
    Navigator.push(context , PageTransition(type: pageTransitionType , child: widget));
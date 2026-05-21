import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}
Widget shrink() {
  return const SizedBox.shrink();
}
Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Future<void> shareImageAndText(String title,String path) async {

  await Share.share(
    title,
    subject: 'Check this post',
  );
}
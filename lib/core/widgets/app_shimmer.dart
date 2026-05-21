import 'package:flutter/material.dart';
import 'package:reelsapps/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {

  const AppShimmer({super.key,});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.textPrimaryLight,
      highlightColor: Colors.grey.shade100,
      child: Container(height: double.infinity, width: double.infinity, color: Colors.white),
    );
  }
}

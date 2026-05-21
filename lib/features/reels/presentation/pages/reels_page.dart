import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/app_error_widget.dart';
import '../../../../core/widgets/app_shimmer.dart';
import '../../data/models/reel_model.dart';
import '../bloc/reels_bloc.dart';
import '../widgets/reel_item_widget.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ReelsBloc, ReelsState>(
        builder: (context, state) {
          if (state.status == ReelsStatus.loading) {
            return  AppShimmer();
          }

          if (state.status == ReelsStatus.error) {
            return AppErrorWidget(
              message: state.error ?? 'Error',
              onRetry: () {
                context.read<ReelsBloc>().add(LoadReels());
              },
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              context.read<ReelsBloc>().add(RefreshReels());
            },
            child: PageView.builder(
              scrollDirection: Axis.vertical,

              itemCount: state.reels.length,

              itemBuilder: (context, index) {
                return ReelItemWidget(reel: state.reels[index] as ReelModel);
              },
            ),
          );
        },
      ),
    );
  }
}

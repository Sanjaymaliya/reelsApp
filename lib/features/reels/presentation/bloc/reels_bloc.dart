import '../../data/models/reel_model.dart';
import '../../domain/reel_entity.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/reels_repository_impl.dart';

abstract class ReelsEvent {}

class LoadReels extends ReelsEvent {}

class OnTapLike extends ReelsEvent {
  final int reelId;
  OnTapLike(this.reelId);

}

class RefreshReels extends ReelsEvent {}


enum ReelsStatus {
  initial,
  loading,
  success,
  error,
}

class ReelsState {

  final List<ReelEntity> reels;

  final ReelsStatus status;

  final String? error;

  ReelsState({
    this.reels = const [],
    this.status = ReelsStatus.initial,
    this.error,
  });

  ReelsState copyWith({
    List<ReelEntity>? reels,
    ReelsStatus? status,
    String? error,
  }) {
    return ReelsState(
      reels: reels ?? this.reels,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}


class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {

  final ReelsRepositoryImpl repository;

  ReelsBloc(this.repository) : super(ReelsState()) {

    on<LoadReels>(_loadReels);

    on<RefreshReels>(_refreshReels);

    on<OnTapLike>(_OnTapLike,);
  }

  Future<void> _loadReels(LoadReels event, Emitter<ReelsState> emit,) async {

    emit(state.copyWith(status: ReelsStatus.loading,),);

    try {

      final reels = await repository.getReels();

      emit(state.copyWith(reels: reels, status: ReelsStatus.success,),);

    } catch (e) {

      emit(state.copyWith(status: ReelsStatus.error, error: e.toString(),),);

    }
  }

  Future<void> _refreshReels(RefreshReels event, Emitter<ReelsState> emit,) async {
    add(LoadReels());
  }

  void _OnTapLike(
      OnTapLike event,
      Emitter<ReelsState> emit,
      ) {

    final index = state.reels.indexWhere((user) => user.id == event.reelId);

    if (index != -1) {
      state.reels[index] = ReelModel(
          id: state.reels[index].id,
          title: state.reels[index].title,
          likes: state.reels[index].likes,
          thumbnailUrl: state.reels[index].thumbnailUrl,
          videoUrl: state.reels[index].videoUrl,
          isLiked: !state.reels[index].isLiked, viewedAt:'');

    }

    emit(state.copyWith(reels: state.reels),);
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/reels/data/datasource/reels_local_datasource.dart';
import 'features/reels/data/datasource/reels_remote_datasource.dart';
import 'features/reels/data/repository/reels_repository_impl.dart';
import 'features/reels/presentation/bloc/reels_bloc.dart';
import 'features/reels/presentation/pages/reels_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  final remoteDataSource = ReelsRemoteDataSource();

  final localDataSource = ReelsLocalDataSource();

  final repository = ReelsRepositoryImpl(remote: remoteDataSource, local: localDataSource);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final ReelsRepositoryImpl repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.system,

      darkTheme: ThemeData.dark(),

      theme: ThemeData.light(),

      home: BlocProvider(
        create: (_) => ReelsBloc(repository)..add(LoadReels()),
        child: const ReelsPage(),
      ),
    );
  }
}

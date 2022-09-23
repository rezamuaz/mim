import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mim/src/core/Dio/dio_client.dart';
import 'package:mim/src/data/datasource/remote/services_network.dart';
import 'package:mim/src/data/repositories/datasource_repositories.dart';
import 'package:mim/src/presentation/bloc/memes_bloc.dart';
import 'package:mim/src/presentation/views/home/home_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: RepositoryProvider(
      create: (context) =>
          DataSourceRepositories(ServicesNetwork(DioClient(Dio()))),
      child: BlocProvider(
        create: (context) => MemesBloc(
            dataSourceRepositories: context.read<DataSourceRepositories>())
          ..add(const MemesLoaded()),
        child: const Scaffold(body: Homelayput()),
      ),
    ));
  }
}

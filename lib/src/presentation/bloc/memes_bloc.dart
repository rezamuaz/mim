import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mim/src/data/model/post_model_response.dart';
import 'package:mim/src/data/repositories/datasource_repositories.dart';

part 'memes_event.dart';
part 'memes_state.dart';

class MemesBloc extends Bloc<MemesLoaded, MemesState> {
  DataSourceRepositories dataSourceRepositories;
  MemesBloc({required this.dataSourceRepositories}) : super(MemesLoading()) {
    on<MemesLoaded>((event, emit) async {
      try {
        emit(MemesLoading());
        final memesLoad = await dataSourceRepositories.getPost();
        emit(MemesLoad(memesLoad));
      } catch (e) {
        emit(MemesFailed());
      }
    });
  }
}

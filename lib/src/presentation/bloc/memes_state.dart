part of 'memes_bloc.dart';

abstract class MemesState extends Equatable {
  const MemesState();

  @override
  List<Object> get props => [];
}

class MemesLoading extends MemesState {}

class MemesLoad extends MemesState {
  final List<Memes> memes;
  const MemesLoad(this.memes);
  @override
  List<Object> get props => [memes];
}

class MemesFailed extends MemesState {
  final String status = 'error';
  @override
  List<Object> get props => [];
}

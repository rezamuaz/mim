import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mim/src/presentation/bloc/memes_bloc.dart';
import 'package:mim/src/presentation/widgets/item_widget.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemesBloc, MemesState>(
      builder: (context, state) {
        return CustomScrollView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  childAspectRatio: 1,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/detail',
                            arguments: state is MemesLoad
                                ? state.memes[index].url
                                : '');
                      },
                      child: ItemWidget(
                          imageUrl:
                              state is MemesLoad ? state.memes[index].url : ''),
                    );
                  },
                  childCount: state is MemesLoad ? state.memes.length : 12,
                ),
              )
            ]);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mim/src/presentation/bloc/memes_bloc.dart';
import 'package:mim/src/presentation/views/home/grid_widget.dart';
import 'package:mim/src/presentation/widgets/title_custom.dart';

class Homelayput extends StatelessWidget {
  const Homelayput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const TitleCustom(title: 'MimGenerator', fontSize: 18),
                const SizedBox(
                  height: 10,
                ),
                Transform.rotate(
                  angle: 90,
                  child: IconButton(
                      onPressed: () {
                        BlocProvider.of<MemesBloc>(context)
                            .add(const MemesLoaded());
                      },
                      icon: const Icon(
                        Icons.loop,
                        size: 30,
                      )),
                ),
              ]),
            ),
          ),
          const Flexible(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: GridWidget(),
            ),
          )
        ],
      ),
    );
  }
}

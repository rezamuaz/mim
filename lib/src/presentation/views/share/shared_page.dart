import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SharedPage extends StatelessWidget {
  const SharedPage({Key? key, this.multiargs = const []}) : super(key: key);
  final List<dynamic> multiargs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Flexible(
            child: Stack(
              children: [
                CachedNetworkImage(imageUrl: multiargs[0]),
                Positioned(
                    left: 12,
                    top: 12,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          height: 100,
                          width: 100,
                          child: multiargs[1] != null
                              ? Image.file(
                                  File(multiargs[1]),
                                  fit: BoxFit.cover,
                                )
                              : const SizedBox(),
                        ),
                        Container(
                          height: 100,
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width - 130,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              multiargs[2],
                              softWrap: true,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Simpan', style: TextStyle(fontSize: 16)),
                          SizedBox(height: 10),
                          Icon(Icons.share, size: 30)
                        ],
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Shared', style: TextStyle(fontSize: 16)),
                          SizedBox(height: 10),
                          Icon(Icons.share, size: 30)
                        ],
                      ))
                ],
              ))
        ],
      ),
    );
  }
}

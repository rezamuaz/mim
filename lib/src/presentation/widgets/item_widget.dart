import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, this.imageUrl = ''}) : super(key: key);
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1 / 1,
        child: imageUrl!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: imageUrl!,
              )
            : Shimmer(child: Container()));
  }
}

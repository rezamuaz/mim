import 'package:flutter/material.dart';
import 'package:mim/src/presentation/views/detail/detail_layout.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MimGenerator'),
        centerTitle: true,
      ),
      body: DetailLayout(imageUrl: url),
    );
  }
}

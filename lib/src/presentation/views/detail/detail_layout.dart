import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DetailLayout extends StatefulWidget {
  const DetailLayout({Key? key, this.imageUrl = ''}) : super(key: key);
  final String imageUrl;

  @override
  State<DetailLayout> createState() => _DetailLayoutState();
}

class _DetailLayoutState extends State<DetailLayout> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  final TextEditingController _textFieldController = TextEditingController();
  late String codeDialog = '';
  late String valueText = '';

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add Caption'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration:
                  const InputDecoration(hintText: "Hi, my name is Azner"),
            ),
            actions: <Widget>[
              TextButton(
                child:
                    const Text('CANCEL', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              TextButton(
                child: const Text('OK', style: TextStyle(color: Colors.green)),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Flexible(
            child: Stack(
              children: [
                CachedNetworkImage(imageUrl: widget.imageUrl),
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
                          child: image != null
                              ? Image.file(
                                  File(image!.path),
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
                              valueText,
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
                      onPressed: () async {
                        final XFile? pickedFile = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (pickedFile == null) return;
                        setState(() {
                          image = (pickedFile);
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Add Logo', style: TextStyle(fontSize: 16)),
                          SizedBox(height: 10),
                          Icon(Icons.image, size: 30)
                        ],
                      )),
                  TextButton(
                      onPressed: () {
                        _displayTextInputDialog(context);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Add Text', style: TextStyle(fontSize: 16)),
                          SizedBox(height: 10),
                          Icon(Icons.title, size: 30)
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

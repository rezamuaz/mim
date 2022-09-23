import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailLayout extends StatefulWidget {
  const DetailLayout({Key? key, this.imageUrl = ''}) : super(key: key);
  final String imageUrl;

  @override
  State<DetailLayout> createState() => _DetailLayoutState();
}

class _DetailLayoutState extends State<DetailLayout> {
  final TextEditingController _textFieldController = TextEditingController();

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

  late String codeDialog;
  late String valueText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Flexible(
            child: CachedNetworkImage(imageUrl: widget.imageUrl),
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
                      ))
                ],
              ))
        ],
      ),
    );
  }
}

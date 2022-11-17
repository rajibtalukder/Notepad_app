import 'package:flutter/material.dart';
import 'package:my_notepad/accessories.dart';
import 'package:my_notepad/home.dart';

class NotepadDetails extends StatefulWidget {
  String mline;
  int index;
  NotepadDetails({super.key, required this.mline, required this.index});
  @override
  State<NotepadDetails> createState() => _NotepadDetailsState();
}

class _NotepadDetailsState extends State<NotepadDetails> {
  var _text = '';
  TextEditingController _controller = TextEditingController();

  @override
  // ignore: unused_element
  void initState() {
    _controller = TextEditingController(text: widget.mline);
    _text = widget.mline;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                saveData(widget.index, _text);
              });
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: ((context) =>const Home())),
                  (route) => false);
            },
            child: Text(
              'Save and Exit',
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 18),
            ),
          ),
          // const SizedBox(
          //   width: 15,
          // ),
          // TextButton(
          //   onPressed: () {
          //   },
          //   child: Text(
          //     'Save and Exit',
          //     style: TextStyle(
          //         color: Theme.of(context).primaryColor, fontSize: 18),
          //   ),
          // )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: TextField(
          onChanged: (String value) {
            setState(() {
              _text = value;
            });
          },
          controller: _controller,
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
      ),
    );
  }
}

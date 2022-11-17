import 'package:flutter/material.dart';
import 'package:my_notepad/accessories.dart';
import 'package:my_notepad/notepad_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Future deleteDialog(BuildContext context, String mline) {
      return showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do you want to remove this note?'),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        removeData(mline);
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text('Yes')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('No')),
              ],
            );
          }));
    }

    return Scaffold(
        //backgroundColor: Colors.black87,
        appBar: AppBar(
          title: Text(
            'My Notepad',
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
            future: readData(),
            builder: (context, snapshot) {
              return CustomScrollView(
                slivers: [
                  SliverGrid.count(
                    crossAxisCount: 2,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            addData();
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(Icons.add, size: 50),
                        ),
                      ),
                      ...datas.map((mline) {
                        int index = datas.indexWhere(
                          (element) => element == mline,
                        );
                        return InkWell(
                          onLongPress: () {
                            deleteDialog(context, mline);
                          },
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => NotepadDetails(
                                      mline: mline,
                                      index: index,
                                    )));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              mline,
                              // style:
                              //     TextStyle(color: Theme.of(context).cardColor),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              );
            }));
  }
}

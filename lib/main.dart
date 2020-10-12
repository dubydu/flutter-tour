import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyObject {
  String title;
  SelectedState isSelected;
  MyObject({this.title, this.isSelected});
}

enum SelectedState{ selected, unSelected }

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScaffoldList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyScaffoldList extends StatefulWidget {

  List<MyObject> _listMyObject = List<MyObject>();

  void _setupData() {
    _listMyObject = [];
    for(var i = 0; i < 10; i++) {
      _listMyObject.add(MyObject(title: 'Oeschinen Lake Campground ${i + 1}', isSelected: SelectedState.unSelected));
    }
  }

  @override
  State<StatefulWidget> createState() {
    _setupData();
    return _MyScaffoldListState();
  }
}

class _MyScaffoldListState extends State<MyScaffoldList> {
  List<MyObject> _listMyObject = List<MyObject>();

  void _setupData() {
    _listMyObject = [];
    for(var i = 0; i < 20; i++) {
      _listMyObject.add(MyObject(title: 'Oeschinen Lake Campground ${i + 1}', isSelected: SelectedState.unSelected));
    }
  }

  @override
  Widget build(BuildContext context) {
    _setupData();
    List<Widget> _buildCells(List<MyObject> data) {
      return List.generate(
        data.length, (index) => Container(
        width: MediaQuery.of(context).size.width - 16,
        color: Colors.white,
        margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
              ),
              title: const Text(
                  'Card title 1',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20.0),
              ),
              subtitle: Text(
                'Secondary Text',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Image(
                image: AssetImage('assets/img_catalina.png'),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 0),
              child: Text('Within subtitle property you can customize the typography by using the style property.'),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      FlatButton(
                        onPressed: () {
                          // Perform some action
                        },
                        child: const Text('ACTION 1'),
                      ),
                      FlatButton(
                        onPressed: () {
                          // Perform some action
                        },
                        child: const Text('ACTION 2'),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.share_rounded),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                })
              ],
            )
          ],
        )
      ),
      );
    }

    return Scaffold(
      bottomNavigationBar: BottomAppBar(

      ),
      appBar: AppBar(
        title: Text('Flutter Tour')
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                  child:
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:
                    Column(
                      children: _buildCells(_listMyObject),
                    ),
                  )
              )
            ],
          )
      ),
    );
  }
}

void main() => runApp(MyScaffold());
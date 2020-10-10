import 'package:flutter/material.dart';

class MyObject {
  String title;
  bool isSelected;
  MyObject({this.title, this.isSelected});
}

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[500]
      ),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Navigation bar',
              onPressed: null,
          ),
          Expanded(
              child: title
          ),
          IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {

  List<MyObject> _listMyObject = List<MyObject>();

  void _setupData() {
    _listMyObject = [];
    for(var i = 0; i < 10; i++) {
      _listMyObject.add(MyObject(title: 'Oeschinen Lake Campground ${i + 1}', isSelected: false));
    }
  }

  @override
  Widget build(BuildContext context) {

    _setupData();

    List<Widget> _buildCells(List<MyObject> data) {
      return List.generate(
        data.length, (index) => Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width - 24,
        height: 65.0,
        color: Colors.white,
        margin: EdgeInsets.all(4.0),
        child: ListTile(
          title: Text('${data[index].title}',
                  style: TextStyle(
                      fontWeight: FontWeight.w500
                  )
          ),
          leading: Icon(Icons.label_important),
          trailing: Radio(
            onChanged: (value) {

            },
          ),
        ),
      ),
      );
    }

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          color: Colors.amberAccent,
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Flutter Tour'),
        actions: [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
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

void main() {
  runApp(MaterialApp(
    title: 'Flutter Tour',
    home: MyScaffold(),
    debugShowCheckedModeBanner: false,
  ));
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/**
 * 鱼塘
 */
class GroupPage extends StatefulWidget{

  _GroupPageState createState() => new _GroupPageState();
}
class _GroupPageState extends State<GroupPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GroupPage"),
      ),
      body: new Text("GroupPage"),
    );
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

}
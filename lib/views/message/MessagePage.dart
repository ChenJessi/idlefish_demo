
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/**
 * 消息
 */
class MessagePage extends StatefulWidget{
  _MessagePage createState() => new _MessagePage();
}

class _MessagePage extends State<MessagePage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MessagePage"),
      ),
      body: new Text("MessagePage"),
    );
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

}
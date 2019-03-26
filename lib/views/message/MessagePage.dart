import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/**
 * 消息
 */
class MessagePage extends StatefulWidget {
  _MessagePage createState() => new _MessagePage();
}

class _MessagePage extends State<MessagePage>
    with AutomaticKeepAliveClientMixin {

  final _messageType = <String>[
    "活动消息",
    "通知",
    "通知",
    "通知",
    "通知",
    "通知",
    "通知",
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("消息", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: Image.asset(
            "images/coin_help.png", width: 30.0, height: 30.0,),
              onPressed: _helpPressed),
        ],
        backgroundColor: Colors.white,
      ),
      body: _messageList(),
    );
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  /**
   * 消息列表
   */
  Widget _messageList() {
    return ListView.builder(
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return new Divider(height: 1.0,);
          }
          final index = i ~/ 2;
          if(index < 7){
            return _messageItem(index, index);
          }
        }
    );
  }

  /**
   * message
   */
  Widget _messageItem(int index, int type) {
    return Container(
      padding: EdgeInsets.only(top: 16.0, bottom: 10.0),
      child: new InkWell(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Expanded(
              child: new Container(
                child: _iconType(type),
              ),
              flex: 1,
            ),
            new Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(_messageType[type],
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                    textAlign: TextAlign.left,
                  ),
                  new Text("活动消息",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey[20], fontSize: 14.0),
                  ),
                  new Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: new Text("1天前",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.grey, fontSize: 10.0),
                    ),
                  ),
                ],
              ),)
          ],
        ),
      ),
    );
  }


  Image _iconType(int type) {
    switch (type) {
      case 0:
        return Image.asset(   //活动消息
          "images/icon_main_message_activity.png", width: 50.0, height: 50.0,);
      case 1:
        return Image.asset(
          "images/icon_main_message_comment.png", width: 50.0, height: 50.0,);
      case 2:
        return Image.asset(
          "images/icon_main_message_system.png", width: 50.0, height: 50.0,);
      case 3:
        return Image.asset(
          "images/icon_main_message_pool_folder.png", width: 50.0, height: 50.0,);
      case 4:
        return Image.asset(
          "images/icon_main_message_pond_message.png", width: 50.0, height: 50.0,);
      case 5:
        return Image.asset(
          "images/icon_main_message_my_follow.png", width: 50.0, height: 50.0,);
      case 6:
        return Image.asset(
          "images/icon_main_message_item_trend.png", width: 50.0, height: 50.0,);
    }
  }

  /**
   * 帮助
   */
  void _helpPressed() {

  }
}
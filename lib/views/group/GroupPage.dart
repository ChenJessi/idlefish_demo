import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/**
 * 鱼塘
 */
class GroupPage extends StatefulWidget {
  _GroupPageState createState() => new _GroupPageState();
}

class _GroupPageState extends State<GroupPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "鱼塘",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Center(
          child: new Text(
            "我的",
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
        ),
        actions: <Widget>[

          new IconButton(
              icon: Image.asset(
                "images/coin_help.png",
                width: 30.0,
                height: 30.0,
              ),
              tooltip: "长按提示",
              onPressed: _myTap),
        ],
        backgroundColor: Colors.white,
      ),
      body: _groupList(),
    );
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
}

/**
 *  l鱼塘列表
 */
Widget _groupList() {
  return ListView.builder(
    shrinkWrap: true,
      itemBuilder: (context, i) {
    if (i == 0) {
      return _typeGroup();
    }
  });
}

/**
 * 顶部
 * 鱼塘类型
 */
Widget _typeGroup() {

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Container(
        child: Center(
          child: new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              new Image.asset(
                "images/search.png",
                height: 40.0,
                width: 350.0,
                fit: BoxFit.fill,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                new Image.asset(
                  "images/ic_search_box.png",
                ),
                new Text("搜索鱼塘")
              ],),
            ],
          ),
        ),
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      ),
      new Text("aaaaaa"),
       GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 10.0,
        crossAxisCount: 5,
        shrinkWrap: true,
        children: <Widget>[
          new Column(
            children: <Widget>[
              new ClipOval(
                child:  new Image.asset(
                  "images/ic_search_box.png",
                ),
              ),
              const   Text("搜索鱼塘"),
            ],
          ),

         const Text("搜索鱼塘"),
         const Text("搜索鱼塘"),
         const Text("搜索鱼塘"),
         const Text("搜索鱼塘"),
         const Text("搜索鱼塘"),
        ],),
    ],
  );
}

/**
 * 我的鱼塘
 */
void _myTap() {}

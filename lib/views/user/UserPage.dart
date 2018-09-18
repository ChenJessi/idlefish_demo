
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserPage extends StatefulWidget{
  _UserPageState createState() => new _UserPageState();
}
class _UserPageState extends State<UserPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("userPage"),
      ),
      body: new Text("userPage"),
    );
  }

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('_UserPageState initState');
  }
}
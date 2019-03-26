import 'package:flutter/material.dart';
import 'package:idlefish_demo/utils/ColorsResource.dart';
import 'package:idlefish_demo/views/home/HomePage.dart';

dynamic mContext;

class ReleaseDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    mContext = context;
    return new ReleasePage();
    return new WillPopScope(
      child: new Material(
        color: ColorsResource.white_transparent85,
        child: new InkWell(
          onTap: _dismiss,
          child: new Container(
            alignment: Alignment.bottomCenter,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Container(
                  child: new Image.asset(
                    "images/ic_navibar_close.png",
                    width: 20.0,
                    height: 20.0,
                  ),
                  margin: const EdgeInsets.only(bottom: 44.0),
                ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () {
        _dismiss();
      },
    );
  }

//  Animation<EdgeInsets> movement = EdgeInsetsTween(
//    begin: EdgeInsets.only(top: 0.0),
//    end: EdgeInsets.only(top: 100.0),
//  ).animate(
//    CurvedAnimation(
//      // ignore: implicit_this_reference_in_initializer
//      parent: null,
//      curve: Interval(
//        0.2,
//        0.375,
//        curve: Curves.fastOutSlowIn,
//      ),
//    ),
//  );
  /**
   * 关闭对话框
   */
  void _dismiss() {
    Navigator.pop(mContext);
  }
}

class ReleasePage extends StatefulWidget {
  _ReleasePage createState() => new _ReleasePage();
}

class _ReleasePage extends State<ReleasePage> with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<EdgeInsets> movement;

  void _initController() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WillPopScope(
      child: new Material(
        color: ColorsResource.white_transparent85,
        child: new InkWell(
          onTap: _dismiss,
          child: new Container(
            alignment: Alignment.bottomCenter,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.all(20.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          item(0),
                          item(1),
                          item(2),
                        ],
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.all(20.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          item(0),
                          item(1),
                          item(2),
                        ],
                      ),
                    ),
//                    new Image.asset(
//                      "images/ic_navibar_close.png",
//                      width: 40.0,
//                      height: 40.0,
//                    ),
                  ],
                ),
                new Container(
                  child: new Image.asset(
                    "images/ic_navibar_close.png",
                    width: 20.0,
                    height: 20.0,
                  ),
                  margin: const EdgeInsets.only(bottom: 44.0),
                ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () {
        _dismiss();
      },
    );
  }

  /**
   *
   */
  Widget item(int type){
   return new InkWell(
      child: new Column(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(20.0),
            child: new Image.asset(
              "images/ic_navibar_close.png",
              width: 40.0,
              height: 40.0,
            ),
          ),
          Text("发布闲置"),
        ],
      ),
      onTap: (){
        _release(type);
      },
    );
  }
  void _initAni() {
    movement = EdgeInsetsTween(
      begin: EdgeInsets.only(top: 100.0, right: 500.0),
      end: EdgeInsets.only(top: 300.0, right: 100.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.1,
          0.5,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        print(status);
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initController();
    _initAni();
    _startAnimation();
  }

  void _dismiss() {
    Navigator.pop(mContext);
//  initState();
//    _startAnimation();
  }

  /**
   * 发布
   */
  void _release(int type) {

  }

  Future _startAnimation() async {
    try {
//      await _controller.repeat();
      await _controller.repeat();
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

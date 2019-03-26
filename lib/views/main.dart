import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:idlefish_demo/utils/Animation.dart';
import 'package:idlefish_demo/views/group/GroupPage.dart';
import 'package:idlefish_demo/views/home/HomePage.dart';
import 'package:idlefish_demo/views/message/MessagePage.dart';
import 'package:idlefish_demo/views/release/ReleaseDialog.dart';
import 'package:idlefish_demo/views/user/UserPage.dart';
import 'package:idlefish_demo/views/widget/Animation.dart';
import 'package:idlefish_demo/views/widget/NavigationIconView.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin{
  int _tabIndex = 0; // 默认选中首页
  PageController _pageController = new PageController();
  BottomNavigationBar bottomNavigationBar;
  Scaffold scaffold;


  final List<StatefulWidget> _pages = [
     HomePage(),
     GroupPage(),
     UserPage(),
     MessagePage(),
     UserPage(),
//     AnimationPage(),
  ];
  List<NavigationIconView> _bottomNavigations;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.loose,
      overflow: Overflow.visible,
      children: <Widget>[
    scaffold=new Scaffold(

          body: new PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            pageSnapping: true,
            physics: new NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _pages[_tabIndex];
            },
            itemCount: _pages.length,
          ),
          bottomNavigationBar: bottomNavigationBar = new BottomNavigationBar(
            items: _bottomNavigations.map((NavigationIconView item) =>
            item.item).toList(),
            currentIndex: _tabIndex,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.yellow[900],
            onTap: (index) {
              _tabIndex = index;
              _pageController.jumpToPage(index);
              setState(() {
                _tabIndex = index;
              });
            },),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              child: new Container(
                child: new Image.asset(
                  "images/home_tab.png", width: 60.0, height: 60.0,),
                margin: const EdgeInsets.only(bottom: 25.0),
              ),
              onTap: _onCenterTap,
            ),
          ),

        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState initState');
    _bottomNavigations = [
      new NavigationIconView(
          icon: new Image.asset(
            "images/ic_tabbar_home_nor.png", width: 25.0, height: 25.0,),
          activeIcon: new Image.asset(
            "images/ic_tabbar_home_sel.png", width: 25.0, height: 25.0,),
          title: new Text("咸鱼",),
          vsync: this),
      new NavigationIconView(
          icon: new Image.asset(
            "images/ic_tabbar_group_nor.png", width: 25.0, height: 25.0,),
          activeIcon: Image.asset(
            "images/ic_tabbar_group_sel.png", width: 25.0, height: 25.0,),
          title: new Text("鱼塘"),
          vsync: this),
      new NavigationIconView(
          icon: new Icon(null, size: 25.0,),
          title: new Text("发布"),
          vsync: this),
      new NavigationIconView(
          icon: new Image.asset(
            "images/ic_tabbar_message_nor.png", width: 25.0, height: 25.0,),
          activeIcon: Image.asset(
            "images/ic_tabbar_message_sel.png", width: 25.0, height: 25.0,),
          title: new Text("消息"),
          vsync: this),
      new NavigationIconView(
          icon: new Image.asset(
            "images/ic_tabbar_my_nor.png", width: 25.0, height: 25.0,),
          activeIcon: Image.asset(
            "images/ic_tabbar_my_sel.png", width: 25.0, height: 25.0,),
          title: new Text("我的"),
          vsync: this),
    ];
  }

  /**
   * 中间凸起菜单
   */
  void _onCenterTap() {
    showDialog(
        context: context,
        builder: (context){
          String label = 'test';
          return new ReleaseDialog();
        }
    );
//    Navigator.of(context).pop(
//      new PageRouteBuilder(
//          pageBuilder: (BuildContext context, Animation animation,
//              Animation secondaryAnimation) {
//            return new HomePage();
//          },
//          transitionsBuilder: (BuildContext context,
//              Animation<double> animation,
//              Animation<double> secondaryAnimation,
//              Widget child,) {
//            return AnimUtils.createTransition(animation, child);
//          }
//      ),
//    );
  }

  void _onPageChanged(int index) {
    print('_onPageChanged initState' + index.toString());
    setState(() {
      this._tabIndex = index;
    });
  }

}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:idlefish_demo/utils/ColorsResource.dart';

class UserPage extends StatefulWidget {
  _UserPageState createState() => new _UserPageState();
}

class _UserPageState extends State<UserPage>
    with AutomaticKeepAliveClientMixin {
  /**
   * 状态栏高度
   */
  double _statusBarHeight;

  final _menuTitle = <String>[
    "我发布的",
    "我卖出的",
    "我买到的",
    "我租到的",
    "我收藏的",
    "我的鱼塘",
    "我的拍卖",
    "我参与的免费送",
    "我的咸鱼币",
    "我的红包",
    "咸鱼Family",
    "咸鱼服务社",
    "咸鱼招商",
    "安全中心",
    "实人通行证",
    "设置",
  ];
  final _iconTitle = <Image>[
    Image.asset("images/entry_icon_on_shelf.png", width: 30.0, height: 30.0,),
    Image.asset("images/entry_icon_sold.png", width: 30.0, height: 30.0,),
    Image.asset("images/entry_icon_bought.png", width: 30.0, height: 30.0,),
    Image.asset("images/ic_my_rented_2x.png", width: 30.0, height: 30.0,),
    Image.asset("images/entry_icon_favourite.png", width: 30.0, height: 30.0,),
    Image.asset("images/ic_tabbar_group_sel.png", width: 30.0, height: 30.0,),
    Image.asset("images/entry_icon_paimai.png", width: 30.0, height: 30.0,),
    Image.asset("images/xianyu_mfs_2x.png", width: 30.0, height: 30.0,),
    Image.asset("images/xianyu_coin_2x.png", width: 30.0, height: 30.0,),

    Image.asset("images/xianyu_coin_2x.png", width: 30.0, height: 30.0,),
    Image.asset("images/xianyu_coin_2x.png", width: 30.0, height: 30.0,),
    Image.asset("images/xianyu_coin_2x.png", width: 30.0, height: 30.0,),
    Image.asset("images/xianyu_coin_2x.png", width: 30.0, height: 30.0,),
    Image.asset("images/xianyu_coin_2x.png", width: 30.0, height: 30.0,),
    Image.asset("images/xianyu_coin_2x.png", width: 30.0, height: 30.0,),

    Image.asset("images/entry_icon_settings.png", width: 30.0, height: 30.0,),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    return new Scaffold(
      body: new RefreshIndicator(
        onRefresh: () {},
        child: _userList(),
      ),
    );
  }

  /**
   * listView
   */
  Widget _userList() {
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider(height: 1.0,);
        final index = i ~/ 2;
        if (index == 0) {
          return _topLayout();
        } else if (index == 1) {
          return _communicationLayout();
        }
//        else if (index == 2 || index == 12 || index == 19 || index == 21) {
//          return new Container(height: 15.0, color: ColorsResource.white1);
//        } else if (index < _menuTitle.length + 5) {
//          int itemIndex = index < 12 ? index - 3 : (index < 19
//              ? index - 4
//              : index - 5);
//          return _buildItem(itemIndex);
//        }
      },
    );
  }

  /**
   * 顶部item
   */
  Widget _topLayout() {
    return new Container(
      padding: EdgeInsets.only(
          top: 20.0 + _statusBarHeight, bottom: 20.0, left: 16.0, right: 16.0),
      child: new InkWell(
        child: new Row(
          children: <Widget>[
            new Expanded(
              flex: 3,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "我是咸鱼",
                    style: new TextStyle(fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,),
                  new Text("我真的是咸鱼",
                    style: new TextStyle(fontSize: 15.0, color: Colors.grey),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,),

                ],
              ),),
            new Expanded(
              flex: 1,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(
                    "images/home_tab.png", width: 60.0, height: 60.0,),
                  new Icon(Icons.chevron_right,),
                ],
              ),),
          ],
        ),
        onTap: _onTilTap,
      ),
    );
  }

  /**
   * 顶部社交信息布局
   */
  Widget _communicationLayout() {
    return new Container(
      padding: const EdgeInsets.all(16.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new InkWell(
              child: new Column(
                children: <Widget>[
                  new Text(
                    "0",
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    softWrap: true,
                    textAlign: TextAlign.center,),
                  new Text(
                    "超赞",
                    style: TextStyle(fontSize: 15.0, color: Colors.grey[500]),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              onTap: _praiseTap,
            ),
          ),
          new Expanded(
            child: new InkWell(
              child: new Column(
                children: <Widget>[
                  new Text(
                    "0",
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    softWrap: true,
                    textAlign: TextAlign.center,),
                  new Text(
                    "关注数",
                    style: TextStyle(fontSize: 15.0, color: Colors.grey[500]),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              onTap: _followTap,
            ),
          ),
          new Expanded(
            child: new InkWell(
              child: new Column(
                children: <Widget>[
                  new Text(
                    "0",
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    softWrap: true,
                    textAlign: TextAlign.center,),
                  new Text(
                    "粉丝数",
                    style: TextStyle(fontSize: 15.0, color: Colors.grey[500]),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              onTap: _fansTap,
            ),
          ),
        ],
      ),
    );
  }


  /**
   * 列表项
   */
  Widget _buildItem(int index) {
    bool visible = index == 0 || index == 1 || index == 2 || index == 4 ||
        index == 5 || index == 7 || index == 8;
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Row(
              children: <Widget>[
                _iconTitle[index],
                new Container(
                  alignment: Alignment.centerRight,
                  child: new Text(
                    _menuTitle[index], style: TextStyle(fontSize: 15.0),),
                  margin: const EdgeInsets.only(left: 10.0),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Container(
                  alignment: Alignment.centerRight,
                  child: new Text(
                    visible ? "0" : "", style: TextStyle(fontSize: 15.0),),
                  margin: const EdgeInsets.only(right: 10.0),
                ),
                new Icon(Icons.chevron_right,),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /**
   * 头部点击事件
   */
  void _onTilTap() {
  }

  /**
   * d点赞
   * tap点击
   */
  void _praiseTap() {
  }

  /**
   * 关注
   */
  void _followTap() {
  }

  /**
   * 粉丝
   */
  void _fansTap() {
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


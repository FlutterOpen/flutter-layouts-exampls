///
/// Created by NieBin on 18-12-2
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import '../view/app_bar.dart';
import '../constant/main_const.dart';
import '../view/list_selector.dart';
import '../constant/size_const.dart';
import 'package:flutter_layout/constant/main_const.dart';
import 'package:flutter_layout/screen/move/GridViewPage.dart';
class User {
  User({this.name, this.email});

  final String name;
  final String email;
}

const USER_NAMES = [
  "Isa Tusa",
  "Racquel Ricciardi",
  "Teresita Mccubbin",
  "Rhoda Hassinger",
  "Carson Cupps",
  "Devora Nantz",
  "Tyisha Primus",
  "Muriel Lewellyn",
  "Hunter Giraud",
  "Corina Whiddon",
  "Meaghan Covarrubias",
  "Ulysses Severson",
  "Richard Baxter",
  "Alessandra Kahn",
  "Libby Saari",
  "Valeria Salvador",
  "Fredrick Folkerts",
  "Delmy Izzi",
  "Leann Klock",
  "Rhiannon Macfarlane",
];
const USER_EMAILS = [
  "isa.tusa@me.com",
  "racquel.ricciardi@me.com",
  "teresita.mccubbin@me.com",
  "rhoda.hassinger@me.com",
  "carson.cupps@me.com",
  "devora.nantz@me.com",
  "tyisha.primus@me.com",
  "muriel.lewellyn@me.com",
  "hunter.giraud@me.com",
  "corina.whiddon@me.com",
  "meaghan.covarrubias@me.com",
  "ulysses.severson@me.com",
  "richard.baxter@me.com",
  "alessandra.kahn@me.com",
  "libby.saari@me.com",
  "valeria.salvador@me.com",
  "fredrick.folkerts@me.com",
  "delmy.izzi@me.com",
  "leann.klock@me.com",
  "rhiannon.macfarlane@me.com",
];

class ListScreen extends StatefulWidget {
  ListScreen({Key key, this.group, this.onClick}) : super(key: key);
  final VoidCallback onClick;
  final GroupType group;

  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<ListScreen> {
  var _direction = Axis.vertical;
  List<User> users;

  List<User> _users() {
    var list = List<User>();
    for (int i = 0; i < USER_NAMES.length; i++) {
      var user = User(name: USER_NAMES[i], email: USER_EMAILS[i]);
      list.add(user);
    }
    return list;
  }

  Widget _itemTitle(User user) {
    return ListTile(
      title: Text(
        user.name,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        user.email,
        style: TextStyle(
          color: Colors.white30,
        ),
      ),
      leading: CircleAvatar(
        child: Text(
          user.name[0],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: BAR_BACK_COLORS[widget.group.index],
      ),
    );
  }

  Widget _bodyContent() {
    if (users == null) {
      users = _users();
    }
    var isVertical = _direction == Axis.vertical;
    return ListView.builder(
      scrollDirection: _direction,
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Container(
          alignment: AlignmentDirectional.center,
          color: Colors.brown,
          margin: isVertical
              ? EdgeInsets.only(bottom: 1.0)
              : EdgeInsets.only(right: 1.0),
          constraints: isVertical
              ? BoxConstraints.tightForFinite(height: 80.0)
              : BoxConstraints.tightForFinite(width: 260.0),
          child: _itemTitle(users[index]),
        );
      },
    );
  }

  Widget _topRight() {
    return InkWell(
      onTap: () {
        print("click");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>GridViewPage()));
//        Navigator.of(context).pushNamed(GRID_VIEW_NAME);
      },
      child: Container(
        padding: EdgeInsets.only(right: 10.0),
        child: Center(
          child: Text(
            GRID_VIEW_NAME,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: TEXT_NORMAL_SIZE,
                shadows: [
                  Shadow(color: Colors.grey[800], offset: Offset(0.0, 1.0))
                ]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        group: widget.group,
        itemType: ItemType.list,
        onClick: widget.onClick,
        right: _topRight(),
        bottomView: PreferredSize(
            child: ListSelector(
              mainColor: Colors.white,
              clickDirection: (direct) {
                setState(() {
                  _direction = direct;
                });
              },
            ),
            preferredSize: Size(0.0, SELECTOR_ONE_HEIGHT)),
      ),
      body: Container(
        constraints: _direction == Axis.vertical
            ? null
            : BoxConstraints.tightForFinite(height: 80.0),
        child: Center(
          child: _bodyContent(),
        ),
      ),
    );
  }
}

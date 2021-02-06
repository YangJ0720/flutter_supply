import 'package:flutter/material.dart';
import 'package:supply/page/location/model/location_model.dart';
import 'package:supply/widget/bar/base_app_bar.dart';
import 'package:supply/widget/bar/simple_app_bar.dart';

///
class LocationEditPage extends StatelessWidget {
  ///
  LocationModel _getArguments(BuildContext context) {
    var model = ModalRoute.of(context).settings.arguments;
    if (model == null) {
      model = LocationModel('', '', '', '');
    }
    return model;
  }

  @override
  Widget build(BuildContext context) {
    LocationModel model = _getArguments(context);
    return Scaffold(
      appBar: BaseAppBar(widget: SimpleAppBar(title: '编辑地址')),
      body: Column(
        children: [
          //
          Container(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: '地址',
              ),
              controller: TextEditingController(text: model.tag),
              textInputAction: TextInputAction.next,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.1),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          //
          Container(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: '地址',
              ),
              controller: TextEditingController(text: model.address),
              textInputAction: TextInputAction.next,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.1),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          // 姓名
          Container(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: '姓名',
              ),
              controller: TextEditingController(text: model.name),
              textInputAction: TextInputAction.next,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.1),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          // 电话
          Container(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: '电话号码',
              ),
              controller: TextEditingController(text: model.phone),
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.1),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          // 保存
          InkWell(
            child: Container(
              alignment: Alignment.center,
              child: Text('保存', style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
              ),
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, top: 20, right: 10),
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

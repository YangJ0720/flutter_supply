import 'package:flutter/material.dart';

///
class IndexCategoryGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexCategoryGridViewState();
  }
}

class _IndexCategoryGridViewState extends State<IndexCategoryGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (_, index) {
        return InkWell(
          child: Container(
            alignment: Alignment.center,
            child: Text('index = $index'),
            color: Colors.grey[200],
          ),
          onTap: () => print('index = $index'),
        );
      },
      itemCount: 10,
      padding: EdgeInsets.all(5),
      physics: BouncingScrollPhysics(),
    );
  }
}

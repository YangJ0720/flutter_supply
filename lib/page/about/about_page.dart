
import 'package:flutter/material.dart';
import 'package:supply/bloc/about_bloc.dart';
import 'package:supply/bloc/engine/bloc_engine.dart';

///
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocEngine(
      builder: (context, bloc) {
        return Scaffold(
          appBar: AppBar(
            title: Text(DateTime.now().toString()),
            centerTitle: true,
          ),
          body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text('当前版本: v1.0.0'),
                Text('当前日期: ${DateTime.now().toString()}'),
                //
                StreamBuilder<bool>(
                  builder: (_, snapshot) {
                    var data = snapshot.data;
                    var date = DateTime.now().toString();
                    var text = '是否有版本更新:$data\n发布日期:$date';
                    return Container(
                      child: Text(text, textAlign: TextAlign.center),
                    );
                  },
                  stream: bloc.stream,
                  initialData: false,
                ),
                //
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () => bloc.checkVersion('1.0.0'),
                ),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        );
      },
      bloc: AboutBloc(),
    );
  }
}

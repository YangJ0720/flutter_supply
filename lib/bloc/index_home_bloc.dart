import 'package:rxdart/rxdart.dart';
import 'package:supply/bloc/engine/bloc_engine.dart';
import 'package:supply/config/base_config.dart';
import 'package:supply/page/index/home/model/home_model.dart';
import 'package:supply/tools/network_load_tools.dart';

class IndexHomeBloc implements BlocBase {

  BehaviorSubject<HomeModel> _subject = BehaviorSubject();
  Sink<HomeModel> get sink => _subject.sink;
  Stream<HomeModel> get stream => _subject.stream;

  ///
  Future<void> loadData() async {
    var url = '${BaseConfig.host}home/home.json';
    String response = await NetworkLoadTools.load(url);
    print('response = $response');
    if (response != null && response.isNotEmpty) {
      sink.add(HomeModel.fromRawJson(response));
    } else {
      sink.add(null);
    }
  }

  @override
  void dispose() {
    _subject.close();
    _subject = null;
  }

}
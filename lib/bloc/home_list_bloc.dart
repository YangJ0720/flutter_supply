import 'package:flutter_bloc/flutter_bloc.dart';

/// 首页 -> 列表
class HomeListBloc extends Bloc<CounterEvent, int> {

  HomeListBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    yield state - 1;
  }

}

enum CounterEvent {
  decrement,
  increment,
}
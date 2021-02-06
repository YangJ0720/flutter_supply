import 'package:flutter/material.dart';

///
abstract class BlocBase {
  ///
  void dispose();
}

class BlocEngine<T extends BlocBase> extends StatefulWidget {
  final Widget Function(BuildContext context, T model) builder;
  final T bloc;
  final Function(T) initialize;
  final bool userDispose;

  BlocEngine({
    Key key,
    @required this.builder,
    @required this.bloc,
    this.initialize,
    this.userDispose: true,
  }) : super(key: key);

  @override
  _BlocEngineState<T> createState() => _BlocEngineState<T>();
}

class _BlocEngineState<T extends BlocBase> extends State<BlocEngine<T>> {

  @override
  void initState() {
    super.initState();
    var bloc = widget.bloc;
    if (bloc != null) widget.initialize(bloc);
  }

  @override
  void dispose() {
    if (widget.userDispose) widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.bloc);
  }
}

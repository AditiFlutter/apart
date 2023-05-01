import 'package:apart/view_model/base_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


abstract class BaseWidget<V extends BaseViewModel> extends StatefulWidget {
  const BaseWidget({Key? key}) : super(key: key);

  @override
  State<BaseWidget> createState() => _BaseWidgetState<V>();

  @protected
  Widget buildUI(BuildContext context, V viewModel);

}

class _BaseWidgetState<V extends BaseViewModel> extends State<BaseWidget> with AutomaticKeepAliveClientMixin {
  late V v;

  @override
  void initState() {
    v = context.read<V>();
    v.setContext(context);
    v.initView();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.buildUI(context,context.watch<V>());
  }

  @override
  void dispose() {
    v.disposeView();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

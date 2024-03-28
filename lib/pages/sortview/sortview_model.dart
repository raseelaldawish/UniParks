import '/flutter_flow/flutter_flow_util.dart';
import 'sortview_widget.dart' show SortviewWidget;
import 'package:flutter/material.dart';

class SortviewModel extends FlutterFlowModel<SortviewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

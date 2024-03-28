import '/flutter_flow/flutter_flow_util.dart';
import 'edite_parking_details_widget.dart' show EditeParkingDetailsWidget;
import 'package:flutter/material.dart';

class EditeParkingDetailsModel
    extends FlutterFlowModel<EditeParkingDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

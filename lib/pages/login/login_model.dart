import '/components/microftlogin_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for microftlogin component.
  late MicroftloginModel microftloginModel;

  @override
  void initState(BuildContext context) {
    microftloginModel = createModel(context, () => MicroftloginModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    microftloginModel.dispose();
  }
}

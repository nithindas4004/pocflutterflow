import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'microftlogin_model.dart';
export 'microftlogin_model.dart';

class MicroftloginWidget extends StatefulWidget {
  const MicroftloginWidget({super.key});

  @override
  State<MicroftloginWidget> createState() => _MicroftloginWidgetState();
}

class _MicroftloginWidgetState extends State<MicroftloginWidget> {
  late MicroftloginModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MicroftloginModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isAndroid
        ? Container()
        : Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
            child: FFButtonWidget(
              onPressed: () async {
                GoRouter.of(context).prepareAuthEvent();
                final user = await authManager.signInWithApple(context);
                if (user == null) {
                  return;
                }

                context.goNamedAuth('HomePage', context.mounted);
              },
              text: FFLocalizations.of(context).getText(
                'k2aa33ba' /* Continue with Microsoft */,
              ),
              icon: const FaIcon(
                FontAwesomeIcons.apple,
                size: 20.0,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 44.0,
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
                hoverColor: FlutterFlowTheme.of(context).primaryBackground,
              ),
            ),
          );
  }
}

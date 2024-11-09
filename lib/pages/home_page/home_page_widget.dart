import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'TakePhoto',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      var shouldSetState = false;
                      final selectedMedia = await selectMedia(
                        maxWidth: 800.00,
                        maxHeight: 800.00,
                        imageQuality: 80,
                        multiImage: false,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        safeSetState(() => _model.isDataUploading = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];

                        try {
                          selectedUploadedFiles = selectedMedia
                              .map((m) => FFUploadedFile(
                                    name: m.storagePath.split('/').last,
                                    bytes: m.bytes,
                                    height: m.dimensions?.height,
                                    width: m.dimensions?.width,
                                    blurHash: m.blurHash,
                                  ))
                              .toList();
                        } finally {
                          _model.isDataUploading = false;
                        }
                        if (selectedUploadedFiles.length ==
                            selectedMedia.length) {
                          safeSetState(() {
                            _model.uploadedLocalFile =
                                selectedUploadedFiles.first;
                          });
                        } else {
                          safeSetState(() {});
                          return;
                        }
                      }

                      _model.apiResultu0k = await TakePhotoCall.call(
                        imageFile: _model.uploadedLocalFile,
                      );

                      shouldSetState = true;
                      if ((_model.apiResultu0k?.succeeded ?? true)) {
                        FFAppState().photoURL = TakePhotoCall.photoURL(
                          (_model.apiResultu0k?.jsonBody ?? ''),
                        )!;
                        safeSetState(() {});
                        _model.apiResulthab = await WhatIsThisPhotoCall.call(
                          photoURL: FFAppState().photoURL,
                        );

                        shouldSetState = true;
                        if ((_model.apiResulthab?.succeeded ?? true)) {
                          FFAppState().EnglishWord =
                              WhatIsThisPhotoCall.photoObjName(
                            (_model.apiResulthab?.jsonBody ?? ''),
                          )!;
                          safeSetState(() {});
                          _model.apiResultrsmArabicWord =
                              await TranslateCall.call(
                            wordToArabic: FFAppState().EnglishWord,
                          );

                          shouldSetState = true;
                          if ((_model.apiResultrsmArabicWord?.succeeded ??
                              true)) {
                            FFAppState().objPhoto = TranslateCall.arabicWord(
                              (_model.apiResultrsmArabicWord?.jsonBody ?? ''),
                            )!;
                            FFAppState().ArabicWord = TranslateCall.arabicWord(
                              (_model.apiResultrsmArabicWord?.jsonBody ?? ''),
                            )!;
                            safeSetState(() {});
                            _model.apiResultykqARex =
                                await GetExampleWordCall.call(
                              arabicWord: FFAppState().ArabicWord,
                            );

                            shouldSetState = true;
                            if ((_model.apiResultykqARex?.succeeded ?? true)) {
                              FFAppState().ArabicWordExample =
                                  GetExampleWordCall.arabicWordExample(
                                (_model.apiResultykqARex?.jsonBody ?? ''),
                              )!;
                              safeSetState(() {});
                              if (shouldSetState) safeSetState(() {});
                              return;
                            } else {
                              if (shouldSetState) safeSetState(() {});
                              return;
                            }
                          } else {
                            if (shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else {
                          if (shouldSetState) safeSetState(() {});
                          return;
                        }
                      } else {
                        if (shouldSetState) safeSetState(() {});
                        return;
                      }

                      if (shouldSetState) safeSetState(() {});
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/camera.png',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      FFAppState().photoURL,
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    FFAppState().objPhoto,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    FFAppState().ArabicWordExample,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

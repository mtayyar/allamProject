import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'level1_model.dart';
export 'level1_model.dart';

class Level1Widget extends StatefulWidget {
  const Level1Widget({super.key});

  @override
  State<Level1Widget> createState() => _Level1WidgetState();
}

class _Level1WidgetState extends State<Level1Widget> {
  late Level1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Level1Model());

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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/ddd.png',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 270.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    FFAppState().photoURL,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  FFAppState().ArabicWord,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Cairo',
                        fontSize: 25.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Text(
                    FFAppState().ArabicWordExample,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Cairo',
                          color: const Color(0xFFB55100),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
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

                    _model.apiResultfsiPhoto = await TakePhotoCall.call(
                      imageFile: _model.uploadedLocalFile,
                    );

                    shouldSetState = true;
                    if ((_model.apiResultfsiPhoto?.succeeded ?? true)) {
                      FFAppState().photoURL = TakePhotoCall.photoURL(
                        (_model.apiResultfsiPhoto?.jsonBody ?? ''),
                      )!;
                      safeSetState(() {});
                      _model.apiResultfpkPhotoWord =
                          await WhatIsThisPhotoCall.call(
                        photoURL: FFAppState().photoURL,
                      );

                      shouldSetState = true;
                      if ((_model.apiResultfpkPhotoWord?.succeeded ?? true)) {
                        FFAppState().EnglishWord =
                            WhatIsThisPhotoCall.photoObjName(
                          (_model.apiResultfpkPhotoWord?.jsonBody ?? ''),
                        )!;
                        safeSetState(() {});
                        _model.apiResultecrGetArabicWord =
                            await TranslateCall.call(
                          wordToArabic: FFAppState().EnglishWord,
                        );

                        shouldSetState = true;
                        if ((_model.apiResultecrGetArabicWord?.succeeded ??
                            true)) {
                          FFAppState().objPhoto = TranslateCall.arabicWord(
                            (_model.apiResultecrGetArabicWord?.jsonBody ?? ''),
                          )!;
                          FFAppState().ArabicWord = TranslateCall.arabicWord(
                            (_model.apiResultecrGetArabicWord?.jsonBody ?? ''),
                          )!;
                          safeSetState(() {});
                          _model.apiResultlyqWordExample =
                              await GetExampleWordCall.call(
                            arabicWord: FFAppState().ArabicWord,
                          );

                          shouldSetState = true;
                          if ((_model.apiResultlyqWordExample?.succeeded ??
                              true)) {
                            FFAppState().ArabicWordExample =
                                GetExampleWordCall.arabicWordExample(
                              (_model.apiResultlyqWordExample?.jsonBody ?? ''),
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
                      'assets/images/btn-photo.png',
                      width: 139.0,
                      height: 112.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

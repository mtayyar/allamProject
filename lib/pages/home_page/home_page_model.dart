import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (TakePhoto)] action in Image widget.
  ApiCallResponse? apiResultu0k;
  // Stores action output result for [Backend Call - API (what is this Photo)] action in Image widget.
  ApiCallResponse? apiResulthab;
  // Stores action output result for [Backend Call - API (translate)] action in Image widget.
  ApiCallResponse? apiResultrsmArabicWord;
  // Stores action output result for [Backend Call - API (GetExampleWord)] action in Image widget.
  ApiCallResponse? apiResultykqARex;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

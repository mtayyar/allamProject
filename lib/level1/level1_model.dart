import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'level1_widget.dart' show Level1Widget;
import 'package:flutter/material.dart';

class Level1Model extends FlutterFlowModel<Level1Widget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (TakePhoto)] action in Image widget.
  ApiCallResponse? apiResultfsiPhoto;
  // Stores action output result for [Backend Call - API (what is this Photo)] action in Image widget.
  ApiCallResponse? apiResultfpkPhotoWord;
  // Stores action output result for [Backend Call - API (translate)] action in Image widget.
  ApiCallResponse? apiResultecrGetArabicWord;
  // Stores action output result for [Backend Call - API (GetExampleWord)] action in Image widget.
  ApiCallResponse? apiResultlyqWordExample;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

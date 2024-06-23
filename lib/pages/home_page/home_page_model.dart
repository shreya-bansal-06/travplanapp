import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String? travelPrompt;

  String? travelPlan;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Destination widget.
  final destinationKey = GlobalKey();
  FocusNode? destinationFocusNode;
  TextEditingController? destinationTextController;
  String? destinationSelectedOption;
  String? Function(BuildContext, String?)? destinationTextControllerValidator;
  // State field(s) for StartDay widget.
  FocusNode? startDayFocusNode;
  TextEditingController? startDayTextController;
  String? Function(BuildContext, String?)? startDayTextControllerValidator;
  // State field(s) for CalendarStart widget.
  DateTimeRange? calendarStartSelectedDay;
  // State field(s) for EndDay widget.
  FocusNode? endDayFocusNode;
  TextEditingController? endDayTextController;
  String? Function(BuildContext, String?)? endDayTextControllerValidator;
  // State field(s) for CalendarEnd widget.
  DateTimeRange? calendarEndSelectedDay;
  // State field(s) for Budget widget.
  FocusNode? budgetFocusNode;
  TextEditingController? budgetTextController;
  String? Function(BuildContext, String?)? budgetTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // Stores action output result for [Backend Call - API (PHPOpenAI)] action in Submit widget.
  ApiCallResponse? aiResponse;

  @override
  void initState(BuildContext context) {
    calendarStartSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarEndSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    destinationFocusNode?.dispose();

    startDayFocusNode?.dispose();
    startDayTextController?.dispose();

    endDayFocusNode?.dispose();
    endDayTextController?.dispose();

    budgetFocusNode?.dispose();
    budgetTextController?.dispose();
  }
}

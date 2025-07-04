import 'package:flutter/widgets.dart';
import 'package:ftp/core/extensions/build_context.dart';

String? textFieldNotEmptyValidator(BuildContext context, String? value) {
  if (value?.isEmpty ?? true) return context.loc.validatorTextFieldIsEmpty;

  return null;
}

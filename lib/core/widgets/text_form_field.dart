import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef ValidatorCallback = String? Function(BuildContext, String?);

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({
    this.obscureText = false,
    this.readOnly = false,
    this.labelText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    Key? key,
  }) : super(key: key);

  final bool obscureText;
  final bool readOnly;
  final TextEditingController? controller;
  final String? labelText;
  final ValidatorCallback? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
    keyboardType: widget.keyboardType,
    inputFormatters: widget.inputFormatters,
    controller: _controller,
    validator: (value) =>
        widget.readOnly ? null : widget.validator?.call(context, value),
    obscureText: widget.obscureText,
    readOnly: widget.readOnly,
    decoration: InputDecoration(
      labelText: widget.labelText,
      suffix: IconButton(
        onPressed: () => widget.readOnly ? null : _controller?.clear(),
        icon: const Icon(Icons.close),
      ),
    ),
  );
}

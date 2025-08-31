import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftp/core/data/ftp/ftp_client.dart';
import 'package:ftp/core/data/storage/storage_repository.dart';
import 'package:ftp/core/extensions/build_context.dart';
import 'package:ftp/core/utils/validators.dart';
import 'package:ftp/core/widgets/app_bar.dart';
import 'package:ftp/core/widgets/text_form_field.dart';
import 'package:ftp/features/connection_new/bloc/connection_new_bloc.dart';

@RoutePage()
class ConnectionNewScreen extends StatefulWidget implements AutoRouteWrapper {
  const ConnectionNewScreen({Key? key}) : super(key: key);

  @override
  State<ConnectionNewScreen> createState() => _ConnectionNewScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<ConnectionNewBloc>(
    create: (context) => ConnectionNewBloc(
      ftpClient: context.read<FtpClient>(),
      ftpStorage: context.read<StorageRepository>(),
    ),
    child: this,
  );
}

class _ConnectionNewScreenState extends State<ConnectionNewScreen> {
  final _formKey = GlobalKey<FormState>();

  final _serverTextController = TextEditingController();
  final _portTextController = TextEditingController();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  bool _isAnonymousSelected = false;
  FtpSecurityType _selectedSecurityType = FtpSecurityType.ftp;

  @override
  void initState() {
    super.initState();
    _portTextController.text = _selectedSecurityType.getDefaultPort.toString();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<ConnectionNewBloc, ConnectionNewState>(
        listener: (context, state) {
          switch (state) {
            case ConnectionNewSuccess(:final ftpConnectResult):
              switch (ftpConnectResult) {
                case FtpConnectResult.success:
                  context.router.maybePop();
                case FtpConnectResult.failure:
                  context.scaffoldMesenger.showSnackBar(
                    SnackBar(
                      content: Text(context.loc.snackBarFTPConnectFailed),
                    ),
                  );
              }
            case ConnectionNewFailure(:final exception):
              context.scaffoldMesenger.showSnackBar(
                SnackBar(content: Text(exception.toString())),
              );
            default:
          }
        },
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            appBar: const MyAppBar(),
            body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsetsGeometry.only(
                  left: 16,
                  right: 16,
                  top: 30,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 20,
                    children: [
                      Row(
                        spacing: 50,
                        children: [
                          Expanded(
                            child: MyTextFormField(
                              controller: _serverTextController,
                              validator: textFieldNotEmptyValidator,
                              labelText: context.loc.textFieldHintServer,
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: MyTextFormField(
                              controller: _portTextController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validator: textFieldNotEmptyValidator,
                              labelText: context.loc.textFieldHintPort,
                            ),
                          ),
                        ],
                      ),

                      MyTextFormField(
                        controller: _usernameTextController,
                        validator: textFieldNotEmptyValidator,
                        labelText: context.loc.textFieldHintUsername,
                        readOnly: _isAnonymousSelected,
                      ),
                      CheckboxListTile(
                        value: _isAnonymousSelected,
                        onChanged: _checkboxChanged,
                        title: Text(context.loc.anonymousMode),
                        contentPadding: EdgeInsets.zero,
                        visualDensity: const VisualDensity(
                          horizontal: -4,
                          vertical: -4,
                        ),
                      ),
                      MyTextFormField(
                        controller: _passwordTextController,
                        validator: textFieldNotEmptyValidator,
                        labelText: context.loc.textFieldHintPassword,
                        obscureText: true,
                        readOnly: _isAnonymousSelected,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          spacing: 15,
                          children: FtpSecurityType.values
                              .map(
                                (e) => ChoiceChip(
                                  label: Text(e.name.toUpperCase()),
                                  selected: e == _selectedSecurityType,
                                  onSelected: (value) {
                                    if (!value) return;
                                    _ftpSecurityChanged(e);
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text(context.loc.buttonTextConnect),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final completer = Completer<void>();

                              context.read<ConnectionNewBloc>().add(
                                ConnectionNewSubmitButtonTapped(
                                  server: _serverTextController.text,
                                  port: int.parse(_portTextController.text),
                                  username: _usernameTextController.text,
                                  password: _passwordTextController.text,
                                  securityType: _selectedSecurityType,
                                  completer: completer,
                                ),
                              );

                              await completer.future;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  void _checkboxChanged(bool? newValue) {
    if (newValue!) {
      _usernameTextController.text = 'anonymous';
      _passwordTextController.clear();
    } else {
      _usernameTextController.clear();
    }

    setState(() {
      _isAnonymousSelected = newValue;
    });
  }

  void _ftpSecurityChanged(FtpSecurityType newValue) {
    _portTextController.text = newValue.getDefaultPort.toString();

    setState(() {
      _selectedSecurityType = newValue;
    });
  }
}

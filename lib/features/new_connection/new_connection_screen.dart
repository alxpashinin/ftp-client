import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftp/core/data/ftp/ftp_client.dart';
import 'package:ftp/core/extensions/build_context.dart';
import 'package:ftp/core/utils/validator.dart';
import 'package:ftp/features/new_connection/bloc/new_connection_bloc.dart';

@RoutePage()
class NewConnectionScreen extends StatefulWidget implements AutoRouteWrapper {
  const NewConnectionScreen({Key? key}) : super(key: key);

  @override
  State<NewConnectionScreen> createState() => _NewConnectionScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<NewConnectionBloc>(
        create: (context) => NewConnectionBloc(
          ftpClient: context.read<FtpClient>(),
        ),
        child: this,
      );
}

class _NewConnectionScreenState extends State<NewConnectionScreen> {
  final _formKey = GlobalKey<FormState>();

  final _serverTextController = TextEditingController();

  final _usernameTextController = TextEditingController();

  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      BlocListener<NewConnectionBloc, NewConnectionState>(
        listener: (context, state) {
          switch (state) {
            case NewConnectionSuccess(:final ftpConnectResult)
                when ftpConnectResult == FtpConnectResult.success:
              return;
            case NewConnectionSuccess(:final ftpConnectResult)
                when ftpConnectResult == FtpConnectResult.failed:
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.loc.snackBarFTPConnectFailed)),
              );
            default:
          }
        },
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: EdgeInsets.fromLTRB(
                16,
                20,
                16,
                context.mediaQuery.viewPadding.bottom + 50,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    TextFormField(
                      controller: _serverTextController,
                      validator: (value) =>
                          textFieldNotEmptyValidator(context, value),
                      decoration: InputDecoration(
                        hintText: context.loc.textFieldHintServer,
                      ),
                    ),
                    TextFormField(
                      controller: _usernameTextController,
                      validator: (value) =>
                          textFieldNotEmptyValidator(context, value),
                      decoration: InputDecoration(
                        hintText: context.loc.textFieldHintUsername,
                      ),
                    ),
                    TextFormField(
                      controller: _passwordTextController,
                      obscureText: true,
                      validator: (value) =>
                          textFieldNotEmptyValidator(context, value),
                      decoration: InputDecoration(
                        hintText: context.loc.textFieldHintPassword,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<NewConnectionBloc>().add(
                                  NewConnectionOnSubmitButtonTapped(
                                    server: _serverTextController.text,
                                    username: _usernameTextController.text,
                                    password: _passwordTextController.text,
                                  ),
                                );
                          }
                        },
                        child: Text(context.loc.buttonTextConnect),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

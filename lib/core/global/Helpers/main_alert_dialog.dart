import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showError({
    required BuildContext context,
    required String title,
    required String message,
    required ContentType contentType,
  }) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content

      elevation: 0,

      behavior: SnackBarBehavior.floating,

      backgroundColor: Colors.transparent,

      content: AwesomeSnackbarContent(
        title: title,

        message: message,

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants

        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  void _showCupertinoDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("Success"),
        content: const Text("Saved successfully"),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoButton(
          onPressed: _showCupertinoDialog,
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main_alert_dialog.dart';

Future<void> launchSpecificUrl(context, {required String url}) async {
  try {
    Uri uriUrl = Uri.parse(url);
    if (!await launchUrl(uriUrl)) {
      throw Exception('Could not launch $url');
    }
  } catch (error) {
    log(error.toString());
    CustomSnackbar.showError(
      context: context,

      title: 'Error',
      message: 'Network connection ,try again later..', //!TODO: handle it later
      contentType: ContentType.help,
    );
  }
}

import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<dynamic> showLocationPermissionDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text('Location Services Disabled'),
      content: Text('Please enable location services to use this feature.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop();
            openLocationSettings();
          },
          child: Text('Open Settings'),
        ),
      ],
    ),
  );
}



void openLocationSettings() {
  if (Platform.isAndroid) {
    final intent = AndroidIntent(
      action: 'android.settings.LOCATION_SOURCE_SETTINGS',
    );
    intent.launch();
  } else {
    // For iOS, you can open app settings as a fallback
    openAppSettings();
  }
}
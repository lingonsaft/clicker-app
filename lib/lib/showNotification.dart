import 'package:flutter/material.dart';
import 'dart:async';
import '../components/achivementNotification/achivementNotification.dart';

class ShowNotification {
  void display({
    BuildContext context,
    Duration duration = const Duration(seconds: 2),
    @required String title,
    @required String body,
  }) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => _build(context, title, body)
    );

    overlayState.insert(overlayEntry);
    await Future.delayed(duration);
    overlayEntry.remove();
  }

  Widget _build(BuildContext context, String title, String body) {
    return AchivementNotification(title: title, body: body);
  }
}

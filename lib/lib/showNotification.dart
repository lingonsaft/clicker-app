import 'package:flutter/material.dart';
import 'dart:async';
import '../components/achivementNotification/achivementNotification.dart';

class NotifiactionQueueItem {
  BuildContext context;
  String title;
  String body;
  Duration duration;

  NotifiactionQueueItem(this.context, this.title, this.body, this.duration);
}

class ShowNotification {
  List<NotifiactionQueueItem> achivementNotifications = [];
  bool isRunning = false;

  void addToQueue({
    Duration duration = const Duration(seconds: 2),
    @required BuildContext context,
    @required String title,
    @required String body,
  }) {
    achivementNotifications.add(
      NotifiactionQueueItem(
        context,
        title,
        body,
        duration
      )
    );

    iterateNotifications();
  }

  Future<dynamic> display(NotifiactionQueueItem item) async {
    OverlayState overlayState = Overlay.of(item.context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => _build(context, item.title, item.body)
    );

    overlayState.insert(overlayEntry);
    await Future.delayed(item.duration);
    overlayEntry.remove();
  }

  Widget _build(BuildContext context, String title, String body) {
    return AchivementNotification(title: title, body: body);
  }

  void iterateNotifications() async {
    if (!isRunning) {
      isRunning = true;
      int index = 0;
      while (index < achivementNotifications.length) {
        NotifiactionQueueItem item = achivementNotifications[index];
        await display(item);

        index += 1;
      }
      isRunning = false;
      achivementNotifications = [];
    }
  }
}

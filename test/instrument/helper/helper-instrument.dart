import 'dart:ui';

import 'package:cuacfm/translations/localizations.dart';
import 'package:cuacfm/ui/player/current_player.dart';
import 'package:cuacfm/ui/player/current_timer.dart';
import 'package:cuacfm/utils/connection_contract.dart';
import 'package:cuacfm/utils/notification_subscription_contract.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:mockito/mockito.dart';

class MockTranslations extends Mock implements CuacLocalization {}

class MockNotifcationSubscription extends Mock
    implements NotificationSubscriptionContract {}

class MockConnection extends Mock implements ConnectionContract {}

class MockPlayer extends Mock implements CurrentPlayerContract {}

class MockCurrentTimerContract extends Mock implements CurrentTimerContract{}

void mockTranslationsWithLocale() {
  Injector.appInstance.registerSingleton<CuacLocalization>(
      (_) => CuacLocalization(Locale('en', 'US')),
      override: true);
}

Widget startWidget(Widget widgetToStart) {
  FlutterError.onError = null;
  var size = Size(768, 1024);
  return MaterialApp(
      home: MediaQuery(data: MediaQueryData(size: size), child: widgetToStart));
}

void printMessages(List list) {
  list.forEach((data) {
    print(data.toString());
  });
}

void getTranslations() {
  MockTranslations translations = MockTranslations();
  Injector.appInstance
      .registerSingleton<CuacLocalization>((_) => translations, override: true);
  when(translations.translate(any)).thenReturn("");
  when(translations.getTranslations(any)).thenReturn("");
  when(translations.translateMap(any)).thenReturn(Map.identity());
}

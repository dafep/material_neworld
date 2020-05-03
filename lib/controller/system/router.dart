import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Navigate {
  static navigateTo({context, String route}) {
    Navigator.pushNamed(context, route);
  }

  static initRoute({RouteSettings settings, Map<String, dynamic> map}) {
    return generateRoute(
      settings: settings,
      map: map,
    );
  }
}

generateRoute({RouteSettings settings, Map<String, dynamic> map}) {
  if (map.isNotEmpty) {
    var entryList = map.entries.toList();

    for (int i = 0; i < map.length; i += 1) {
      if (entryList[i].key == settings.name) {
        Widget child = entryList[i].value;
        return _getPageRoute(
          settings: settings,
          child: child,
        );
      }
    }
  } else
    return (null);
}

PageRoute _getPageRoute({Widget child, RouteSettings settings}) {
  return PageTransition(type: PageTransitionType.fade, settings: settings, child: child);
}
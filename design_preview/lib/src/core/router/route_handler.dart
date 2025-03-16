import 'package:flutter/material.dart';

abstract interface class RouteHandler {
  String encodeTitleToPath(String title);
  bool isPathActive(BuildContext context, String path);
  bool isPathParentOfCurrent(BuildContext context, String path);
}

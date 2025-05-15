import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

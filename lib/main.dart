import 'package:flutter/material.dart';

import 'apex.dart';
import 'domain/utilities/initializer.dart';

void main() {
  Initializer.instance.init(() {
    runApp(const Apex());
  });
}




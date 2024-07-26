
import 'package:flutter/material.dart';

import '../factory_design_pattern/button_factory_method.dart';


abstract class AbstractFactory {
  Widget build(BuildContext context, VoidCallback onPressed, String text);
// here we can add another widgets
}

class AndroidWithProgrammer implements AbstractFactory {
  @override
  Widget build(BuildContext context, VoidCallback onPressed, String text) {
    return PlatformButton(Theme.of(context).platform).build(() {
      onPressed();
    },text);
  }

}



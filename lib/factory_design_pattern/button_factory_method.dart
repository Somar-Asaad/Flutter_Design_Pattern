import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// this is how to use the previous code in the main file
//  Widget currentWidget = PlatformButton(Theme.of(context).platform).build(() {
//       debugPrint('nothing serious in android');
//     }, 'Android');
//     Widget IosCheck = PlatformButton(TargetPlatform.iOS).build(() {
//       debugPrint('nothing serious in IOS');
//     }, 'IOS');

abstract class PlatformButton {
  Widget build(
    VoidCallback onPressed,
    String text,
  );

  factory PlatformButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidPlatFormButton();
      case TargetPlatform.iOS:
        return IOSPlatFormButton();
      default:
        return AndroidPlatFormButton();
    }
  }
}

class AndroidPlatFormButton implements PlatformButton {
  @override
  Widget build(VoidCallback onPressed, String text) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class IOSPlatFormButton implements PlatformButton {
  @override
  Widget build(VoidCallback onPressed, String text) {
    return CupertinoButton(onPressed: onPressed, child: Text(text));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:yexder_mobile_client/global/models/system/application_state.dart';
import 'package:yexder_mobile_client/global/models/system/theme_state.dart';

class ColorMode extends StatefulWidget {
  const ColorMode({super.key, required this.context});

  final BuildContext context;

  @override
  State<ColorMode> createState() => _ColorModeState();
}

class _ColorModeState extends State<ColorMode> {
  Brightness brightness = Brightness.light;

  @override
  void initState() {
    super.initState();
    setColorMode();
  }

  void setColorMode() async {
    String? colorMode = await secureStorage.read(key: 'brightness');

    if (colorMode == null && mounted) {
      // brightness = MediaQuery.of(context).platformBrightness;
      brightness = Brightness.light;
    } else {
      brightness = colorMode == 'light' ? Brightness.light : Brightness.dark;
    }

    await secureStorage.write(
      key: "brightness",
      value: brightness == Brightness.light ? 'light' : 'dark',
    );

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (brightness == Brightness.light) {
            colorTheme.setColorMode(colorTheme.darkTheme);
            brightness = Brightness.dark;
          } else {
            colorTheme.setColorMode(colorTheme.lightTheme);
            brightness = Brightness.light;
          }
        });
      },
      child: Image.asset(
        brightness == Brightness.light
            ? "assets/account/color_mode/light_mode.png"
            : "assets/account/color_mode/dark_mode.png",
        width: 30.0,
        height: 30.0,
      ),
    );
  }
}
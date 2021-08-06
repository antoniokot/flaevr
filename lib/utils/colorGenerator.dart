import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorGenerator {
  static Future<PaletteGenerator> getMainColors(
      ImageProvider image, Size size, count) async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(image,
            size: size, maximumColorCount: count);
    return paletteGenerator;
  }
}

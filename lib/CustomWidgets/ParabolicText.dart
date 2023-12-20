
import 'package:flutter/material.dart';

class ParabolicText extends StatelessWidget {
  final String text;
  final double fontSize;

  const ParabolicText({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ParabolicTextPainter(text, fontSize),
    );
  }
}

class ParabolicTextPainter extends CustomPainter {
  final String text;
  final double fontSize;

  ParabolicTextPainter(this.text, this.fontSize);

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );

    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    textPainter.layout(maxWidth: size.width);

    final xOffset = (size.width - textPainter.width) / 2;
    final yOffset = size.height / 2;

    final path = Path();
    path.moveTo(xOffset, yOffset);

    for (int i = 0; i < text.length; i++) {
      final char = text[i];
      final charWidth = textPainter.width / text.length;
      final charOffset = xOffset + i * charWidth;
      final charPath = Path()
        ..addRect(Rect.fromPoints(
            Offset(charOffset, yOffset),
            Offset(charOffset + charWidth, yOffset + fontSize)));

      final matrix4 = Matrix4.rotationZ(-0.2); // Adjust the rotation angle as needed
      charPath.transform(matrix4.storage);

      path.addPath(charPath, Offset.zero);
    }

    canvas.drawPath(path, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
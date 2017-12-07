library simple_plotter;

import 'package:flutter/material.dart';


class LineGraph extends StatefulWidget {

  /// The color in the background of the circle
  final Color backgroundColor;

  /// The foreground color used to indicate progress
  final Color color;

  //The data to be drawn
  final List<double> data;

  final bool fitValues;

  final double strokeWidth;

  LineGraph({
    this.data,
    this.backgroundColor: Colors.white,
    this.color: Colors.black,
    this.fitValues: true,
    this.strokeWidth: 1.0
  });

  @override
  _LineGraphState createState() => new _LineGraphState();
}

class _LineGraphState extends State<LineGraph> {
  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
        painter: new LineGraphCanvas(
            data: widget.data,
            backgroundColor: widget.backgroundColor,
            color: widget.color,
            fitValues: widget.fitValues,
            strokeWidth: widget.strokeWidth
        ));
  }
}

class BarGraph extends StatefulWidget {

  BarGraph({
    this.data,
    this.barOffset: 2.0,
    this.backgroundColor: Colors.white,
    this.color: Colors.black,
  });


  /// The color in the background of the circle
  final Color backgroundColor;

  /// The foreground color used to indicate progress
  final Color color;

  //The data to be drawn
  final List<double> data;

  final double barOffset;

  @override
  _BarGraphState createState() => new _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
        painter: new BarGraphCanvas(
            data: widget.data,
            backgroundColor: widget.backgroundColor,
            color: widget.color,
            barOffset: widget.barOffset
        ));
  }
}


class LineGraphCanvas extends CustomPainter {
  LineGraphCanvas({
    this.data,
    this.backgroundColor: Colors.white,
    this.color: Colors.black,
    this.fitValues: true,
    this.strokeWidth: 1.0
  });


  /// The color in the background of the circle
  final Color backgroundColor;

  /// The foreground color used to indicate progress
  final Color color;

  //The data to be drawn
  final List<double> data;

  final bool fitValues;

  final double strokeWidth;


  double maxValue;
  double minValue;

  int numberOfValues;


  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    Rect background = const Offset(0.0, 0.0) & size;


    canvas.drawRect(background, paint);


    paint
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    if (data != null && !data.isEmpty) {
      computeValues();

      for (var i = 1; i < numberOfValues; i++) {
        drawLine(data[i - 1], data[i], i, size, canvas, paint);
      }
    }
  }

  @override
  bool shouldRepaint(LineGraphCanvas oldDelegate) {
    return data != oldDelegate.data ||
        color != oldDelegate.color ||
        backgroundColor != oldDelegate.backgroundColor;
  }

  computeValues() {
    maxValue =
        new List<double>.from(data).fold(data[0], (i, j) => i > j ? i : j);
    minValue = fitValues
        ? new List<double>.from(data).fold(data[0], (i, j) => i < j ? i : j)
        : 0;
    numberOfValues = data.length;
  }

  void drawLine(double firstPoint, double secondPoint, int index, Size size,
      Canvas canvas, Paint paint) {
    double x1 = (index - 1) * size.width / (numberOfValues - 1);
    double x2 = (index) * size.width / (numberOfValues - 1);

    double y1 = size.height *
        (1 - (firstPoint - minValue) / (maxValue - minValue));
    double y2 = size.height *
        (1 - (secondPoint - minValue) / (maxValue - minValue));

    Offset offsetFirst = new Offset(x1, y1);
    Offset offsetSecond = new Offset(x2, y2);

    canvas.drawLine(offsetFirst, offsetSecond, paint);
  }


}


class BarGraphCanvas extends CustomPainter {
  BarGraphCanvas({
    this.data,
    this.barOffset: 2.0,
    this.backgroundColor: Colors.white,
    this.color: Colors.black,
  });


  /// The color in the background of the circle
  final Color backgroundColor;

  /// The foreground color used to indicate progress
  final Color color;

  //The data to be drawn
  final List<double> data;

  final double barOffset;

  double maxValue;
  double minValue;

  int numberOfValues;


  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    Rect background = const Offset(0.0, 0.0) & size;

    canvas.drawRect(background, paint);

    paint
      ..color = color
      ..style = PaintingStyle.fill;
    computeValues();

    for (var i = 0; i < numberOfValues; i++) {
      drawLine(data[i], i, size, canvas, paint);
    }
  }

  @override
  bool shouldRepaint(BarGraphCanvas oldDelegate) {
    return data != oldDelegate.data ||
        color != oldDelegate.color ||
        backgroundColor != oldDelegate.backgroundColor;
  }

  computeValues() {
    maxValue =
        new List<double>.from(data).fold(data[0], (i, j) => i > j ? i : j);
    minValue =
        new List<double>.from(data).fold(data[0], (i, j) => i < j ? i : j);
    numberOfValues = data.length;
  }

  void drawLine(double value, int index, Size size,
      Canvas canvas, Paint paint) {
    double x1 = (index) * size.width / (numberOfValues) + barOffset;

    double x2 = (index + 1) * size.width / (numberOfValues) - barOffset;

    double y1 = size.height;
    double y2 = size.height *
        (1 - (value - minValue) / (maxValue - minValue));

    Offset offsetBottomLeft = new Offset(x1, y1);
    Offset offsetTopRight = new Offset(x2, y2);

    canvas.drawRect(
        new Rect.fromPoints(offsetBottomLeft, offsetTopRight), paint);
  }


}

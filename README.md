# Simple Plotter

A hobby flutter package for visualizing data. Right now only contains line and bar graphs.

## Getting Started

Installation:
At the moment this is package is just available as git repository, so it can be used only with:
```
dependencies:
   simple_plotter:
     git:
       url: git://github.com/ChrisMarxDev/SimplePlotter.git
```

Set the right import
```dart
import 'package:simple_plotter/simple_plotter.dart';
```

## Usage
Just use the use the available widgets 'LineGraph' or 'BarGraph' as children in your widgets.
May have some problems when the size of the parent widget is not defined.

Examples:
Simple line graph:
```dart
new LineGraph(data: listOfData)
```

With custom values:
```dart
new LineGraph(data: listOfData, backgroundColor: Colors.orange, color: Colors.blue, strokeWidth: 2.5)
```

Simple bar graph:
```dart
new BarGraph(data: listOfData)
```

With custom values:
```dart
new BarGraph(data: listOfData, backgroundColor: Colors.white, color: Colors.black, barOffset: 10.0)
```

Complete as a widget:
```dart
class Example extends StatefulWidget {
   @override
   _ExampleState createState() => new _ExampleState();
 }

 class _ExampleState extends State<Example> {
   @override
   Widget build(BuildContext context) {
     return new Container(child: new LineGraph(
     data: [-1.0, 5.0, 3.5, -7.5, 10.0, -6.4],
     color: Colors.deepOrange,
     strokeWidth: 2.0));
   }
 }
 ```

![Example picture](https://raw.githubusercontent.com/ChrisDevMarx/SimplePlotter/master/example_screenshot.png)


## Contributors
At the moment only myself, feel free to do pull request or download and alter this project.

## License
MIT License

Copyright (c) 2017 Christopher Marx

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.





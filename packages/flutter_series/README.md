# flutter_series
 A flutter plugin for improved row and column widgets with added spacing and optional interleaved dividers.

## Features

A set of widgets that help to make your code cleaner.

| Widgets | Description |
|---|---|
| PadColumn | A Column with optional padding, spacing and dividers. |
| PadRow | A Row with optional padding, spacing and dividers.  |
| SizedWidth | A less frustrating version of SizedBox. |
| SizedHeight | A less frustrating version of SizedBox. |
| HDivider | A simplified Divider widget. |
| VDivider | A simplified VerticalDivider widget.  |

| Functions | Description  |
|---|---|
| navPush | A simple way to push a new page with CupertinoPageRoute styling. |

## Widgets

### PadColumn & PadRow Series'

Simply a Column or Row widget with more control.

A basic PadColumn/PadRow works exactly the same as a normal Column/Row.

```dart
PadColumn(
    children: const [
        Text("flutter_series is"),
        Text("the best flutter package"),
        Text("to date"),
    ],
),
```


However, add a few arguments and you're away!

```dart
PadColumn(
    padding: const EdgeInsets.all(20) + MediaQuery.of(context).padding,
    interleaving: Interleaving.fullDivided,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.start,
    spacing: 20,
    children: const [
        Text("flutter_series is"),
        Text("the best flutter package"),
        Text("to date"),
    ],
),
```
The variable *interleaving* can be assigned for different spacing effects.

| Interleaving Mode | Description |
|---|---|
| none | No spacing is applied, just like a standard series. |
| inBetween | Spacing appears in between children, but not outside of them.|
| full | Spacing appears in between widgets and outside of them. |
| inBetweenDivided | Dividers appear in between children, but not outside of them. |
| fullDivided | Dividers appear in between widgets and outside of them. |

If only spacing is provided, the series will auto assign spacing inBetween

```dart
PadColumn(
    spacing: 20,
    children: const [
        Text("flutter_series is"),
        Text("the best flutter package"),
        Text("to date"),
    ],
),
```

### SizedWidth & SizedHeight
Less frustrating version of SizedBox. 

```dart
SizedWidth(20) = SizedBox(width: 20),
SizedHeight(20) = SizedBox(height: 20),
```

### HDivider & VDivider
Less frustrating versions of Divider. 

```dart
HDivider(20) = Divider(
        height: 20, 
        color: Colors.white.withOpacity(0.3),
    ),
VDivider(20) = VerticalDivider(
        width: 20, 
        color: Colors.white.withOpacity(0.3),
    ),
```

## Getting started

Use this package as a library
Depend on it
Run this command:

With Flutter:
```
$ flutter pub add flutter_series
```
This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):
```yaml
dependencies:
  flutter_series: ^0.0.1
```

Once added to your pubspec.yaml, you can reference the package in your file using:
```dart
import 'package:flutter_series/flutter_series.dart';
```
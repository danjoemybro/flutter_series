library flutter_series;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Sized Height and width are cleaner versions of sized box, with less features.
class SizedHeight extends StatelessWidget {
  const SizedHeight(this.height, {Key? key}) : super(key: key);

  /// The height of the divider spacing. Adds simple spacing totalling the height.
  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}

class SizedWidth extends StatelessWidget {
  const SizedWidth(this.width, {Key? key}) : super(key: key);

  /// The width of the divider spacing. Adds simple spacing totalling the height.
  final double width;

  @override
  Widget build(BuildContext context) => SizedBox(width: width);
}

// HDivider and VDivider

// To change their colors, change your theme's dividerColor
// lightTheme suggestion: const Color(0x8F1F1F1F)
// darkTheme suggestion: const Color(0x8AFFFFFF)

// Add the following to your theme data to your MaterialApp:
/*
themeMode: ThemeMode.system,
theme: ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  dividerTheme: const DividerThemeData(color: Color(0x8F1F1F1F)),
),
darkTheme: ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  dividerTheme: const DividerThemeData(color: Color(0x8AFFFFFF)),
),
*/

class HDivider extends StatelessWidget {
  const HDivider(this.height, {Key? key}) : super(key: key);

  /// The height of the divider spacing. Adds simple spacing totalling the height.
  final double height;

  @override
  Widget build(BuildContext context) {
    return Divider(height: height);
  }
}

class VDivider extends StatelessWidget {
  const VDivider(this.width, {Key? key}) : super(key: key);

  /// The width of the divider spacing. Adds simple spacing totalling the height.
  final double width;

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(width: width);
  }
}

// These are different interleaving modes a user can access
// none:              No spacing is applied, just like a standard series.
// inBetween:         Spacing appears in between children, but not outside of them.
// full:              Spacing appears in between widgets and outside of them.
// inBetweenDivided:  Dividers appear in between children, but not outside of them.
// fullDivided:       Dividers appear in between widgets and outside of them.
enum Interleaving { none, full, inBetween, fullDivided, inBetweenDivided }

// _ListType is only used internally to define what type of series a widget is.
enum _ListType { column, row }

// PadColumn and PadRow  are simply a Column or Row widget with more control.
// Padding can be added  around the entire series add add spacing between widgets.

class PadColumn extends StatelessWidget {
  const PadColumn({
    Key? key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding = EdgeInsets.zero,
    this.interleaving = Interleaving.none,
    this.spacing,
    this.mainAxisSize = MainAxisSize.max,
  }) : super(key: key);

  /// Creates a vertical array of children.
  final List<Widget> children;

  /// How the children should be placed along the main axis in a flex layout.
  final MainAxisAlignment mainAxisAlignment;

  /// How the children should be placed along the cross axis in a flex layout.
  final CrossAxisAlignment crossAxisAlignment;

  /// The amount of space by which to inset the child column.
  final EdgeInsetsGeometry padding;

  /// Where spacing should be applied between children.
  ///
  /// **none:** No spacing is applied, just like a standard series.
  ///
  /// **inBetween:** Spacing appears in between children, but not outside of them.
  ///
  /// **full:** Spacing appears in between widgets and outside of them.
  ///
  /// **inBetweenDivided:** Dividers appear in between children, but not outside of them.
  ///
  /// **fullDivided:** Dividers appear in between widgets and outside of them.
  final Interleaving interleaving;

  /// The distance of spacing between each of the children (pixels).
  final double? spacing;

  /// How much space should be occupied in the main axis.
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    Interleaving localInterleaving = interleaving;
    // If spacing is provided but interleaving is null then add spacing inBetween
    if (spacing != null && interleaving == Interleaving.none) {
      localInterleaving = Interleaving.inBetween;
    }
    List<Widget> widgets = children;
    if (localInterleaving != Interleaving.none) {
      widgets = _divideWidgets(
        children: children,
        interleaving: localInterleaving,
        spacing: spacing ?? 10,
        listType: _ListType.column,
      );
    }
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: widgets,
      ),
    );
  }
}

class PadRow extends StatelessWidget {
  const PadRow({
    Key? key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding = EdgeInsets.zero,
    this.interleaving = Interleaving.none,
    this.spacing,
    this.mainAxisSize = MainAxisSize.max,
  }) : super(key: key);

  /// Creates a horizontal array of children.
  final List<Widget> children;

  /// How the children should be placed along the main axis in a flex layout.
  final MainAxisAlignment mainAxisAlignment;

  /// How the children should be placed along the cross axis in a flex layout.
  final CrossAxisAlignment crossAxisAlignment;

  /// The amount of space by which to inset the child row.
  final EdgeInsetsGeometry padding;

  /// Where spacing should be applied between children.
  ///
  /// **none:** No spacing is applied, just like a standard series.
  ///
  /// **inBetween:** Spacing appears in between children, but not outside of them.
  ///
  /// **full:** Spacing appears in between widgets and outside of them.
  ///
  /// **inBetweenDivided:** Dividers appear in between children, but not outside of them.
  ///
  /// **fullDivided:** Dividers appear in between widgets and outside of them.
  final Interleaving interleaving;

  /// The distance of spacing between each of the children (pixels).
  final double? spacing;

  /// How much space should be occupied in the main axis.
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    Interleaving localInterleaving = interleaving;
    // If spacing is provided but interleaving is null then add spacing inBetween
    if (spacing != null && interleaving == Interleaving.none) {
      localInterleaving = Interleaving.inBetween;
    }
    List<Widget> widgets = children;
    if (localInterleaving != Interleaving.none && children.isNotEmpty) {
      widgets = _divideWidgets(
        children: children,
        interleaving: localInterleaving,
        spacing: spacing ?? 10,
        listType: _ListType.row,
      );
    }
    return Padding(
      padding: padding,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: widgets,
          mainAxisSize: mainAxisSize,
        ),
      ),
    );
  }
}

// This is the calculation for the spacers or dividers.
List<Widget> _divideWidgets({
  required List<Widget> children,
  required Interleaving interleaving,
  required double spacing,
  required _ListType listType,
}) {
  List<Widget> widgets = children;
  int childIndex = -1;

  bool type = interleaving == Interleaving.inBetween ||
      interleaving == Interleaving.inBetweenDivided;
  bool divider = interleaving == Interleaving.inBetweenDivided ||
      interleaving == Interleaving.fullDivided;

  int length = type ? children.length * 2 - 1 : children.length * 2 + 1;
  if (length < 0) length = 0;

  int comparisonNum = type ? 1 : 0;

  widgets = List.generate(length, (index) {
    if (index % 2 == comparisonNum) {
      if (listType == _ListType.column) {
        return divider ? HDivider(spacing) : SizedHeight(spacing);
      } else if (listType == _ListType.row) {
        return divider ? VDivider(spacing) : SizedWidth(spacing);
      }
    }
    childIndex++;
    return children[childIndex];
  });
  return widgets;
}

// A simple way to push a new page with CupertinoPageRoute styling.
// To use, just call
// navPush(context, yourPage);

void navPush(BuildContext context, Widget page, {double pops = 0}) {
  for (var i = 0; i < pops; i++) {
    Navigator.pop(context);
  }
  Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
}

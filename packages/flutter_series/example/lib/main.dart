import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_series/flutter_series.dart';

void main() {
  runApp(const FlutterSeriesApp());
}

class FlutterSeriesApp extends StatelessWidget {
  const FlutterSeriesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Series',
      scrollBehavior: const CupertinoScrollBehavior(),
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20) + MediaQuery.of(context).padding,
        children: [
          Text(
            "Need to knows:",
            style: Theme.of(context).textTheme.headline5,
          ),
          const _Housing(
            title: "Default Behaviour",
            // Sized height can be used to split up widgets in a list where finer control is needed.
            child: PadColumn(
              children: [
                _BackedText("flutter_series is"),
                _BackedText("the best flutter package"),
                _BackedText("to date"),
              ],
            ),
          ),
          const _Housing(
            title: "Defined Spacing",
            // defining spacing alone add spacing between each widget.
            child: PadColumn(
              spacing: 10,
              children: [
                _BackedText("flutter_series is"),
                _BackedText("the best flutter package"),
                _BackedText("to date"),
              ],
            ),
          ),
          const _Housing(
            title: "Spacing and CrossAxisAlignment.stretch",
            // all the common main and cross axis alignment functions still work.
            child: PadColumn(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 10,
              children: [
                _BackedText("flutter_series is"),
                _BackedText("the best flutter package"),
                _BackedText("to date"),
              ],
            ),
          ),
          const _Housing(
            title: "Simple adding of dividers",
            // dividers can be added by defining interleaving as fullDivided or inBetweenDivided
            child: PadColumn(
              interleaving: Interleaving.inBetweenDivided,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 10,
              children: [
                _BackedText("best"),
                _BackedText("flutter"),
                _BackedText("package"),
              ],
            ),
          ),
          const _Housing(
            title: "Works with rows as well",
            // rows work as well
            child: PadRow(
              interleaving: Interleaving.inBetweenDivided,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                _BackedText("best"),
                _BackedText("flutter"),
                _BackedText("package"),
              ],
            ),
          ),
          Text(
            "Interleaving Modes:",
            style: Theme.of(context).textTheme.headline5,
          ),
          const _Housing(
            title: "Interleaving.none",
            child: PadColumn(
              interleaving: Interleaving.none,
              children: [
                _BackedText("flutter_series is"),
                _BackedText("the best flutter package"),
                _BackedText("to date"),
              ],
            ),
          ),
          const _Housing(
            title: "Interleaving.inBetween",
            child: PadColumn(
              interleaving: Interleaving.inBetween,
              children: [
                _BackedText("flutter_series is"),
                _BackedText("the best flutter package"),
                _BackedText("to date"),
              ],
            ),
          ),
          const _Housing(
            title: "Interleaving.full",
            child: PadColumn(
              interleaving: Interleaving.full,
              children: [
                _BackedText("flutter_series is"),
                _BackedText("the best flutter package"),
                _BackedText("to date"),
              ],
            ),
          ),
          const _Housing(
            title: "Interleaving.inBetweenDivided",
            child: PadColumn(
              interleaving: Interleaving.inBetweenDivided,
              children: [
                _BackedText("flutter_series is"),
                _BackedText("the best flutter package"),
                _BackedText("to date"),
              ],
            ),
          ),
          const _Housing(
            title: "Interleaving.fullDivided",
            child: PadColumn(
              interleaving: Interleaving.fullDivided,
              children: [
                _BackedText("flutter_series is"),
                _BackedText("the best flutter package"),
                _BackedText("to date"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Housing extends StatelessWidget {
  const _Housing({
    Key? key,
    required this.child,
    required this.title,
  }) : super(key: key);

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return PadColumn(
      interleaving: Interleaving.full,
      spacing: 15,
      children: [
        Text(title),
        Container(
          // color: Colors.blue,
          child: child,
        ),
      ],
    );
  }
}

class _BackedText extends StatelessWidget {
  const _BackedText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(text),
    );
  }
}

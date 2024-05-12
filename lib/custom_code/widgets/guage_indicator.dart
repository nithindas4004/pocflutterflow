// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:gauge_indicator/gauge_indicator.dart';

class GuageIndicator extends StatefulWidget {
  const GuageIndicator({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<GuageIndicator> createState() => _GuageIndicatorState();
}

class _GuageIndicatorState extends State<GuageIndicator> {
  @override
  Widget build(BuildContext context) {
    return AnimatedRadialGauge(
        duration: const Duration(seconds: 1),
        curve: Curves.elasticOut,

        /// Define the radius.
        /// If you omit this value, the parent size will be used, if possible.
        radius: 100,

        /// Gauge value.
        value: 50,

        /// Optionally, you can configure your gauge, providing additional
        /// styles and transformers.
        axis: GaugeAxis(

            /// Provide the [min] and [max] value for the [value] argument.
            min: 0,
            max: 100,

            /// Render the gauge as a 180-degree arc.
            degrees: 180,

            /// Set the background color and axis thickness.
            style: const GaugeAxisStyle(
              thickness: 20,
              background: Color(0xFFDFE2EC),
              segmentSpacing: 4,
            ),

            /// Define the progress bar (optional).
            progressBar: const GaugeProgressBar.rounded(
              color: Color(0xFFB4C2F8),
            ),

            /// Define axis segments (optional).
            segments: [
              const GaugeSegment(
                from: 0,
                to: 33.3,
                color: Color(0xFFD9DEEB),
                cornerRadius: Radius.zero,
              ),
              const GaugeSegment(
                from: 33.3,
                to: 66.6,
                color: Color(0xFFD9DEEB),
                cornerRadius: Radius.zero,
              ),
              const GaugeSegment(
                from: 66.6,
                to: 100,
                color: Color(0xFFD9DEEB),
                cornerRadius: Radius.zero,
              ),
            ]

            /// You can also, define the child builder.
            /// You will build a value label in the following way, but you can use the widget of your choice.
            ///
            /// For non-value related widgets, take a look at the [child] parameter.
            /// ```
            /// builder: (context, child, value) => RadialGaugeLabel(
            ///  value: value,
            ///  style: const TextStyle(
            ///    color: Colors.black,
            ///    fontSize: 46,
            ///    fontWeight: FontWeight.bold,
            ///  ),
            /// ),
            /// ```
            ));
  }
}

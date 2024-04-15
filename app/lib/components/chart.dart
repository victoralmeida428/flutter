import 'dart:developer';

import 'package:app/resources/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class _MyBarChart extends StatelessWidget {
  final double tem;
  final double teve;
  final double jogou;
  final double fav;
  final double quer;

  const _MyBarChart(
      {required this.tem,
      required this.teve,
      required this.jogou,
      required this.fav,
      required this.quer});

  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
        gridData: const FlGridData(show: false),
        barTouchData: barTouchData,
        minY: 0,
        titlesData: titlesData,
        borderData: borderData,
        alignment: BarChartAlignment.spaceAround,
        barGroups: [
          BarChartGroupData(x: 0, barRods: [
            BarChartRodData(fromY: 0, toY: tem, gradient: _barsGradient)
          ], showingTooltipIndicators: [
            0
          ]),
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(fromY: 0, toY: teve, gradient: _barsGradient)
          ], showingTooltipIndicators: [
            0
          ]),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(fromY: 0, toY: jogou, gradient: _barsGradient)
          ], showingTooltipIndicators: [
            0
          ]),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(fromY: 0, toY: fav, gradient: _barsGradient)
          ], showingTooltipIndicators: [
            0
          ]),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(fromY: 0, toY: quer, gradient: _barsGradient)
          ], showingTooltipIndicators: [
            0
          ]),
        ]));
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
                rod.toY.round().toString(),
                const TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center);
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.deepPurple,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Tem';
        break;
      case 1:
        text = 'Teve';
        break;
      case 2:
        text = 'Jogados';
        break;
      case 3:
        text = 'Fav';
        break;
      case 4:
        text = 'Desejados';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          Colors.deepPurple,
          Colors.cyan.shade300,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );
}

class MyBarChart extends StatefulWidget {
  final double tem;
  final double teve;
  final double jogou;
  final double fav;
  final double quer;

  const MyBarChart(
      {super.key,
      required this.tem,
      required this.teve,
      required this.jogou,
      required this.fav,
      required this.quer});

  @override
  State<StatefulWidget> createState() => MyBarChartState();
}

class BarHorizontal extends StatefulWidget {
  final List<ChartData> data;

  const BarHorizontal({super.key, required this.data});

  @override
  State<BarHorizontal> createState() => _BarHorizontalState();
}

class _BarHorizontalState extends State<BarHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SfCartesianChart(
        primaryXAxis: CategoryAxis(
          isVisible: true,
        ),
        primaryYAxis: NumericAxis(isVisible: false),
        tooltipBehavior: TooltipBehavior(
            enable: true, tooltipPosition: TooltipPosition.auto),
        series: <CartesianSeries<ChartData, String>>[
          BarSeries(
            spacing: 0.8,
            dataSource: widget.data,
            xValueMapper: (ChartData data, _) => data.name,
            yValueMapper: (ChartData data, _) => data.value,
            name: 'Métrica',
            animationDelay: 300,
            animationDuration: 1000,
            gradient: const LinearGradient(colors: [
              AppColors.deepPurplePrimary,
              AppColors.deepPurpleComplement
            ]),
            borderRadius: BorderRadius.circular(10),
            dataLabelSettings: DataLabelSettings(isVisible: true),
          )
        ],
      )
    ]);
  }
}

class MyBarChartState extends State<MyBarChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: _MyBarChart(
          fav: widget.fav,
          jogou: widget.jogou,
          tem: widget.tem,
          quer: widget.quer,
          teve: widget.teve),
    );
  }
}

class ChartData {
  ChartData(this.value, this.name);

  final String name;
  final double value;
}

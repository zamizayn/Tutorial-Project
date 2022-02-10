import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_project/utils/custom.dart';

class Charts extends StatefulWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Charts"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Bar Chart"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: getHeight(context) / 3,
                child: DChartBar(
                  data: [
                    {
                      'id': 'Bar',
                      'data': [
                        {'domain': 'First One', 'measure': 3},
                        {'domain': 'Second One', 'measure': 4},
                        {'domain': '2022', 'measure': 6},
                        {'domain': '2023', 'measure': 0.3},
                      ],
                    },
                  ],
                  domainLabelPaddingToAxisLine: 16,
                  axisLineTick: 2,
                  axisLinePointTick: 2,
                  animate: true,
                  axisLinePointWidth: 10,
                  axisLineColor: Colors.green,
                  measureLabelPaddingToAxisLine: 16,
                  barColor: (barData, index, id) {
                    return index == 0 ? Colors.red : Colors.green;
                  },
                  showBarValue: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Line Chart"),
            ),
            Container(
              height: getHeight(context) / 3,
              child: DChartLine(
                data: [
                  {
                    'id': 'Line',
                    'data': [
                      {'domain': 0, 'measure': 4.1},
                      {'domain': 2, 'measure': 4},
                      {'domain': 3, 'measure': 6},
                      {'domain': 4, 'measure': 1},
                    ],
                  },
                ],
                lineColor: (lineData, index, id) => Colors.amber,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Gauge Chart"),
            ),
            Container(
              height: getHeight(context) / 3,
              child: DChartGauge(
                data: [
                  {'domain': 'Off', 'measure': 30},
                  {'domain': 'Warm', 'measure': 30},
                  {'domain': 'Hot', 'measure': 30},
                ],
                fillColor: (pieData, index) {
                  return pieData["domain"] == "Off"
                      ? Colors.green
                      : pieData["domain"] == "Warm"
                          ? Colors.blue
                          : Colors.red;
                },
                showLabelLine: false,
                pieLabel: (pieData, index) {
                  return "${pieData['domain']}";
                },
                labelPosition: PieLabelPosition.inside,
                labelPadding: 0,
                labelColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

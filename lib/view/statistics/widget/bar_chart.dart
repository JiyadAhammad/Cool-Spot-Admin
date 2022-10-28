import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../../../model/statistic/statistic_model.dart';

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({
    super.key,
    required this.orderStatus,
  });

  final List<OrderStatus> orderStatus;

  @override
  Widget build(BuildContext context) {
    final List<charts.Series<OrderStatus, String>> series =
        <charts.Series<OrderStatus, String>>[
      charts.Series<OrderStatus, String>(
        id: 'orders',
        data: orderStatus,
        domainFn: (OrderStatus datum, int? index) => datum.index.toString(),
        measureFn: (OrderStatus datum, int? index) => datum.orders,
        colorFn: (OrderStatus datum, int? index) => datum.barColor!,
      ),
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}

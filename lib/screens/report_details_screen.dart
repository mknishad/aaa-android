import 'package:aaa/screens/ct_scan_screen.dart';
import 'package:aaa/screens/measurements_screen.dart';
import 'package:flutter/material.dart';

class ReportDetailsScreen extends StatefulWidget {
  const ReportDetailsScreen({super.key});

  @override
  _ReportDetailsScreenState createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends State<ReportDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Report'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'CT Scan'),
              Tab(text: 'Measurements'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CTScanScreen(),
            MeasurementsScreen(),
          ],
        ),
      ),
    );
  }
}

void showProgressDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
            margin: const EdgeInsets.only(left: 24.0),
            child: const Text(
              "Loading...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

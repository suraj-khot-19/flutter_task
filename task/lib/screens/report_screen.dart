import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../services/firestore_service.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
      ),
      body: StreamBuilder(
        stream: firestoreService.getVotingData(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var votes = snapshot.data!.docs;
          debugPrint(votes as String);
          // Process votes data to create charts
          // Here, you will need to parse and analyze the votes data to create the necessary charts

          return ListView(
            children: [
              // Example chart widget
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BarChart(
                  BarChartData(
                      // Populate your chart data
                      // Here, you will need to convert your votes data into the required format for the chart
                      ),
                ),
              ),
              // Add more chart widgets here
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pill_time/feature/reminder/widgets/info_row.dart';

class ReminderDetailsPage extends StatefulWidget {
  const ReminderDetailsPage({super.key});

  @override
  State<ReminderDetailsPage> createState() => _ReminderDetailsPageState();
}

class _ReminderDetailsPageState extends State<ReminderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        child: MaterialButton(
          elevation: 0,
          highlightElevation: 0,
          padding: const EdgeInsets.all(15),
          color: Colors.deepPurple[300],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: const Text(
            "I took this pill today!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () => debugPrint(''),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            backgroundColor: Colors.grey[200],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10.0),
              child: Container(),
            ),
            title: const Text(
              "Medicine",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey[200],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularPercentIndicator(
                      center: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Pills Left',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '10 pills',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      radius: 120,
                      lineWidth: 30,
                      percent: 90 / 100,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.white,
                      linearGradient: LinearGradient(colors: [
                        Colors.green,
                        Colors.lightGreen[300]!,
                      ]),
                      // progressColor: Colors.lightGreen[400],
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const InfoRow(label: 'Name', value: 'Medicine name'),
                  const SizedBox(height: 20),
                  const InfoRow(label: 'Dosage', value: '1 pill'),
                  const SizedBox(height: 20),
                  const InfoRow(label: 'Pill time', value: '12:00'),
                  const SizedBox(height: 20),
                  const InfoRow(label: 'Frequency', value: '8h'),
                  const SizedBox(height: 20),
                  const InfoRow(label: 'Observation', value: 'After lunch'),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

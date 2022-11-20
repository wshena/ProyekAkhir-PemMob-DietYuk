// ignore: file_names

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

List<LineChartBarData> lineChartBarData = [
  LineChartBarData(isCurved: true, spots: [
    const FlSpot(1, 10),
    const FlSpot(2, 12),
    const FlSpot(3, 10),
    const FlSpot(4, 7),
    const FlSpot(5, 8),
    const FlSpot(6, 10),
  ])
];

TextEditingController conBerat = TextEditingController();
TextEditingController conHari = TextEditingController();

String beratBadan = '0';
String hariKe = '0';

class _ProgressPageState extends State<ProgressPage> {
  void setBeratBadan() {
    setState(() {
      beratBadan = conBerat.text;
      hariKe = conHari.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "PROGRES ANDA : ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Berat Badan",
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {
                        ShowFormDialog(context);
                        setBeratBadan();
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
              SizedBox(
                width: width,
                height: height * 0.5,
                child: LineChart(LineChartData(
                    minX: 1,
                    minY: 0,
                    maxX: 7,
                    maxY: 100,
                    lineBarsData: lineChartBarData)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Berat badan anda saat ini : $beratBadan")
            ],
          )),
    );
  }
}

// ignore: non_constant_identifier_names
Future<void> ShowFormDialog(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: conBerat,
                    decoration: const InputDecoration(
                      labelText: 'Berat Badan (kg)',
                    ),
                  ),
                  TextFormField(
                    controller: conHari,
                    decoration: const InputDecoration(
                      labelText: 'Hari ke : ',
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
                child: const Text("Simpan"),
                onPressed: () {
                  beratBadan = conBerat.text;
                  hariKe = conHari.text;
                  Navigator.pop(context);
                }),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  conBerat.text = '';
                  conHari.text = '';
                },
                child: const Text("Batal"))
          ],
        );
      });
}

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.company, required this.type, required this.cpu, required this.gpu, required this.ram, required this.hdd, required this.ssd, required this.state, this.prix}) : super(key: key);
  final prix;
  final company;
  final type;
  final cpu;
  final gpu;
  final ram;
  final hdd;
  final ssd;
  final state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("company: $company", textAlign: TextAlign.center, style: const TextStyle(fontSize: 26)),
            Text("type: $type", textAlign: TextAlign.center, style: const TextStyle(fontSize: 26)),
            Text("cpu: $cpu", textAlign: TextAlign.center, style: const TextStyle(fontSize: 26)),
            Text("gpu: $gpu", textAlign: TextAlign.center, style: const TextStyle(fontSize: 26)),
            Text("ram: $ram", textAlign: TextAlign.center, style: const TextStyle(fontSize: 26)),
            Text("hdd: $hdd", textAlign: TextAlign.center, style: const TextStyle(fontSize: 26)),
            Text("ssd: $ssd", textAlign: TextAlign.center, style: const TextStyle(fontSize: 26)),
            Text("state: $state", textAlign: TextAlign.center, style: const TextStyle(fontSize: 26)),
            Text("$prix DZ", textAlign: TextAlign.center, style: const TextStyle(fontSize: 46, color: Colors.teal)),
          ],
        ),
      ),
    );
  }
}

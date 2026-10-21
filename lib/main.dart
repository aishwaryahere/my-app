import 'package:flutter/material.dart';

void main() => runApp(const SumApp());

class SumApp extends StatelessWidget {
  const SumApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        home: const CalcPage(),
      );
}

class CalcPage extends StatefulWidget {
  const CalcPage({super.key});
  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  final a = TextEditingController();
  final b = TextEditingController();
  String result = '';

  void sum() {
    final x = double.tryParse(a.text);
    final y = double.tryParse(b.text);
    setState(() {
      result = (x == null || y == null) ? 'Enter valid numbers' : '= ${x + y}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A148C), Color(0xFFE91E63)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Quick Sum',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent)),
                const SizedBox(height: 24),
                TextField(
                  controller: a,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'First number',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: b,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Second number',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                FilledButton(onPressed: sum, child: const Text('Add')),
                const SizedBox(height: 24),
                Text(result,
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
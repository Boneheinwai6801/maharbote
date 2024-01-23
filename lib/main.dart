// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedYear = DateTime.now().year;
  int selectmmy = 0;
  DateTime selectedDate = DateTime.now();
  String selectedDay = 'တနင်္ဂနွေ';
  int calculationResult = 0; // Add this line
  bool vasiblle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 250,
                child: Table(
                  border:
                      TableBorder.symmetric(inside: const BorderSide(width: 1)),
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Center(child: Text('')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Center(child: Text('အဓိပတိ')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Center(child: Text('')),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Center(child: Text('အထွန်း')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Center(child: Text('သိုက်')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Center(child: Text('ရာဇ')),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Center(child: Text('မရဏ')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Center(child: Text('ဘင်္ဂ')),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Center(child: Text('ပုတိ')),
                          ),
                        ),
                      ],
                    ),
                    // Add more rows as needed
                  ],
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButton<String>(
                  value: selectedDay,
                  items: [
                    'တနင်္ဂနွေ',
                    'တနင်္လာ',
                    'အင်္ဂါ',
                    'ဗုဒ္ဓဟူး',
                    'ကြာသာပတေး',
                    'သောကြာ',
                    'စနေ',
                  ].map((day) {
                    return DropdownMenuItem<String>(
                      value: day,
                      child: Text(day),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDay = value!;
                    });
                    print("Selected Day: $selectedDay");
                  },
                ),
              ),
              Container(
                  child: DropdownButton<int>(
                value: selectedYear,
                items: List.generate(
                  80,
                  (index) {
                    final year = DateTime.now().year - index;
                    // final myanmarYear = year - 543; // Convert to Myanmar year
                    final mmy = year - 639;

                    final myanmarYear = toMyanmarNumerals(mmy);
                    // final  selectmmy = myanmarYear ;
                    return DropdownMenuItem(
                      value: year,
                      child: Text('$myanmarYear ($year)'),
                    );
                  },
                ),
                onChanged: (value) {
                  setState(() {
                    // selectmmy =
                    selectedYear = value!;
                  });
                  print("Selected Year: $selectedYear");
                },
              )),
              TextButton(
                  onPressed: () {
                    print(selectedYear);
                    print(selectedDate);
                    final mmy = selectedYear - 639; // Calculate Myanmar year
                    print(mmy);
                    calres(selectedDate, mmy);
                    setState(() {
                      vasiblle = true;
                    });
                  },
                  child: const Text('တွက်မည်'))
            ],
          ),
          Container(
            // width: 100,
            // height: 100,
            // color: Colors.black,
            child: vasiblle
                ? Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'အကြွင်း: ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          toMyanmarNumerals(calculationResult),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                : null,
          )
        ],
      ),
    );
  }

  void calres(day, year) {
    final res = year % 7;
    setState(() {
      calculationResult = res; // Update the state with the calculation result
    });
    print(year % 7);
  }
}

String toMyanmarNumerals(int number) {
  const String digits = '၀၁၂၃၄၅၆၇၈၉';
  return number
      .toString()
      .split('')
      .map((digit) => digits[int.parse(digit)])
      .join();
}

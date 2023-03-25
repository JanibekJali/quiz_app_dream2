import 'package:flutter/material.dart';
import 'package:quiz_app_dream2/data/local_data/question_local_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Icon> ikonkalar = [];
  bool isFinished = false;
  Widget containerBer() {
    return Container(
      color: Colors.yellow,
      child: Text(
        'SAlam',
        style: TextStyle(fontSize: 50),
      ),
    );
  }

  bool peredachaAlam() {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            containerBer(),
            isFinished == true
                ?
                //  Container(
                //     child: TextButton(
                //       child: Text(
                //         'Buttu!',
                //         style: TextStyle(
                //           fontSize: 45,
                //           color: Colors.red,
                //         ),
                //       ),
                //       onPressed: () {},
                //     ),
                //   )
                AlertDialog(
                    title: const Text("Suroolor buttu"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            isFinished = false;
                            questionLocalData.surronuAlipKel();
                            questionLocalData.restart();
                            ikonkalar = [];
                            setState(() {});
                          },
                          child: const Text("Kaira bashta"))
                    ],
                  )
                : Text(
                    questionLocalData.surronuAlipKel(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                proveritVoprosy(true);
              },
              child: Container(
                color: Colors.green,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                  child: Text(
                    'Tuura',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                proveritVoprosy(false);
              },
              child: Container(
                color: Colors.red,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  child: Text(
                    'Tuura emes',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(children: ikonkalar)
          ],
        ),
      ),
    );
  }

  void proveritVoprosy(bool koldonuchununJoobu) {
    final bizdinJoop = questionLocalData.jooptuAlipKel();
    if (koldonuchununJoobu == bizdinJoop) {
      ikonkalar.add(
        Icon(
          Icons.check,
          size: 50,
          color: Colors.green,
        ),
      );
    } else if (koldonuchununJoobu != bizdinJoop) {
      ikonkalar.add(
        Icon(
          Icons.close,
          size: 50,
          color: Colors.red,
        ),
      );
    }
    questionLocalData.otkoz();
    if (questionLocalData.surronuAlipKel() == 'suroo buttu') {
      isFinished = true;
    }
    setState(() {});
  }

  bool ailanipAtaby = false;
}

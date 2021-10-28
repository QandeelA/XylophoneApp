import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Main',
      debugShowCheckedModeBanner: false,
      home: DropDown(),
    );
  }
}

class DropDown extends StatefulWidget {
  static String holder = '';
  static String holder_2 = '';
  static List<Color> myList_1 = [];
  static List<int> myList_2 = [];

  @override
  DropDownWidget createState() => DropDownWidget();
}

class DropDownWidget extends State<DropDown> {
  int count = 1;
  void convertion(String color, String soundNumber) {
    var clrNo;
    var wav_no = DropDown.holder_2;
    var number = int.parse(wav_no);
    var clr = DropDown.holder;

    if (clr == 'blue') {
      clrNo = const Color(0xff81d4fa);
      DropDown.myList_1.add(clrNo);
    }
    if (clr == 'Cyan') {
      clrNo = const Color(0xff4dd0e1);
      DropDown.myList_1.add(clrNo);
    }
    if (clr == 'purple') {
      clrNo = const Color(0xff7e57c2);
      DropDown.myList_1.add(clrNo);
    }
    if (clr == 'pink') {
      clrNo = const Color(0xff8e24aa);
      DropDown.myList_1.add(clrNo);
    }
    if (clr == 'grey') {
      clrNo = const Color(0xff9e9e9e);
      DropDown.myList_1.add(clrNo);
    }
    if (clr == 'teal') {
      clrNo = const Color(0xffa7ffeb);
      DropDown.myList_1.add(clrNo);
    }
    if (clr == 'lime') {
      clrNo = const Color(0xfff0f4c3);
      DropDown.myList_1.add(clrNo);
    }
    DropDown.myList_2.add(number);
    print(DropDown.myList_2);
    print(DropDown.myList_1);
    print(count);
  }

  String dropdownValue = 'Cyan';
  String dropdownValue_2 = '1';

  // To show Selected Item in Text.

  List<String> colorName = [
    'blue',
    'Cyan',
    'purple',
    'pink',
    'grey',
    'teal',
    'lime'
  ];
  List<String> soundNo = ['1', '2', '3', '4', '5', '6', '7'];

  void getDropDownItem() {
    setState(() {
      DropDown.holder = dropdownValue;
      DropDown.holder_2 = dropdownValue_2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "images/background1.jpg",
                  alignment: Alignment.centerLeft,
                  height: 100,
                  width: 100,
                ),
                const Text(
                  '   XylophoneApp',
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(
                    height: 60.0,
                  ),
                  const Text(
                    "            Let's choose your Xylophone colors and sounds!!",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  const Padding(padding: EdgeInsets.symmetric()),
                  Text(
                    "         Color number $count ",
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "\n         Sound number $count ",
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 120.0,
                  ),
                  DropdownButton(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    underline: Container(
                      height: 2,
                      color: Colors.teal,
                    ),
                    onChanged: (data) {
                      setState(() {
                        dropdownValue = data.toString();
                      });
                    },
                    items:
                        colorName.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButton(
                    value: dropdownValue_2,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    underline: Container(
                      height: 2,
                      color: Colors.teal,
                    ),
                    onChanged: (data) {
                      setState(() {
                        dropdownValue_2 = data.toString();
                      });
                    },
                    items:
                        soundNo.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  RaisedButton(
                    child: const Text('Lets Play'),
                    onPressed: () {
                      if (count == 7) {
                        count = 0;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => XylophoneApp()));
                      }
                      count++;
                      getDropDownItem();
                      convertion(DropDown.holder, DropDown.holder_2);
                    },
                    color: Colors.teal,
                    textColor: Colors.white,
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

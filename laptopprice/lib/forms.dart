import 'package:flutter/material.dart';
import 'home.dart';

class MyForm extends StatefulWidget {
  final name;
  final icon;
  final image;
  final Widget myWidget;
  const MyForm({Key? key, required this.name, required this.myWidget, this.icon, this.image}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  Color bl = const Color.fromRGBO(21, 32, 43, 1);
  Color blanc = Colors.white;
  Color noir = Colors.black;
  String? cpu;
  String? gpu;
  List<String> cpus = [
    'Apple M1',
    'Intel i3',
    'Intel i5',
    'Intel i7',
    'Intel i9',
    'Amd Ryzen3',
    'Amd Ryzen5',
    'Amd Ryzen7',
    'Amd Ryzen 9',
    'other Intel\'s',
    'other Amd\'s',
  ];
  var swi = 'nb';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          /*
          color: Colors.blueGrey[100],
          boxShadow: [
            BoxShadow(offset: Offset(10, 10), blurRadius: 5, color: Colors.black)
          ],
          */
          border: Border.all(color: Colors.blue, width: 2, style: BorderStyle.solid),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.name, style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w600, color: Colors.black)),
                Icon(widget.icon, size: 68, color: Colors.black),
                Image(height: 68, image: widget.image),
              ],
            ),
            const SizedBox(height: 16),
            widget.myWidget,
          ],
        ),
      ),
    );
  }

  Padding myNewMenu(List<String> myList, witch) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: DropdownButtonFormField<String>(
        value: witch == 'cpu' ? cpu : gpu,
        validator: (value) {
          if (value == null || value.isEmpty) {
            //Toast.show("please fill form", duration: Toast.lengthLong, gravity: Toast.center);
            return "please fill form";
          }
          return null;
        },
        isExpanded: true,
        menuMaxHeight: 250,
        items: myList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
            ),
          );
        }).toList(),
        hint: Text(
          witch == 'cpu' ? "Select cpu type" : "Select gpu type",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        onChanged: (value) {
          setState(() {
            witch == 'cpu' ? cpu = value : gpu = value;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'forms.dart';
import 'result.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> screens = [
    '11.6',
    '12.5',
    '13',
    '13.3',
    '14',
    '14.1',
    '15',
    '15.6',
    '16.1',
    '17',
    '17.3',
    '24',
    '27',
  ];
  List<String> res = [
    'HD',
    'Full HD',
    '2K',
    '3K',
    '4K',
    '5K',
  ];
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
  List<String> gpus = [
    'Intel',
    'Amd',
    'Nvidia',
  ];
  List<String> companies = [
    'Apple',
    'Acer',
    'Asus',
    'Dell',
    'HP',
    'Microsoft',
    'Msi',
    'Razer',
    'Samsung',
  ];
  List<String> types = [
    'NetBook',
    'NoteBook',
    'UltraBook',
    'Gaming',
    'WorkStation',
  ];
  List<int> hdds = [
    0,
    160,
    256,
    320,
    512,
    750,
    1024,
  ];
  List<int> ssds = [
    0,
    64,
    128,
    160,
    256,
    512,
    1024,
    1500,
    2048,
  ];
  String? company;
  String? type;
  String? cpu;
  String? gpu;
  String? screenSize;
  String? resolution;
  double state = 4;
  double ram = 4.0;
  int? ssd;
  int? hdd;
  bool touch = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              MyForm(name: 'touch', image: const AssetImage('assets/status.png'), myWidget: _touchGest()),
              MyForm(name: 'Company', image: const AssetImage('assets/company-icon.png'), myWidget: _myLTMenu(companies, 'com')),
              MyForm(name: 'Type', image: const AssetImage('assets/gaming.png'), myWidget: _myLTMenu(types, 'type')),
              MyForm(name: 'Cpu', image: const AssetImage('assets/cpu.png'), myWidget: _myPUMenu(cpus, 'cpu')),
              MyForm(name: 'Gpu', image: const AssetImage('assets/gpu.png'), myWidget: _myPUMenu(gpus, 'gpu')),
              MyForm(name: 'Ram', image: const AssetImage('assets/ram2.png'), myWidget: _mySlider('ram')),
              MyForm(name: 'hdd', image: const AssetImage('assets/hdd.png'), myWidget: _myStorageMenu(hdds, 'hdd')),
              MyForm(name: 'ssd', image: const AssetImage('assets/ssd.png'), myWidget: _myStorageMenu(ssds, 'ssd')),
              MyForm(name: 'Screen', image: const AssetImage('assets/full-screen.png'), myWidget: _mySRMenu(screens, 'screen')),
              MyForm(name: 'Resolution', image: const AssetImage('assets/hd-screen.png'), myWidget: _mySRMenu(res, 'res')),
              MyForm(name: 'State', image: const AssetImage('assets/loading-bar.png'), myWidget: _mySlider('state')),
              //_calculate(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var result = 155000;
          if (formKey.currentState!.validate()) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Result(company: company, type: type, cpu: cpu, gpu: gpu, ram: ram, hdd: hdd, ssd: ssd, state: state, prix: result)),
            );
          } else {
            showToast(
              'Failed, Please Fill form',
              context: context,
              animation: StyledToastAnimation.scale,
              reverseAnimation: StyledToastAnimation.fade,
              position: StyledToastPosition.center,
              animDuration: const Duration(seconds: 1),
              duration: const Duration(seconds: 4),
              curve: Curves.elasticOut,
              reverseCurve: Curves.linear,
            );
          }
        },
        child: const Icon(Icons.euro_outlined),
      ),
    );
  }

  /*Padding myNewMenu(List<String> myList, witch) {
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
  }*/

  Padding _myPUMenu(List<String> myList, witch) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: DropdownButtonFormField<String>(
        value: witch == 'cpu' ? cpu : gpu,
        validator: (value) {
          if (value == null || value.isEmpty) {
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
          witch == 'cpu' ? "Select Cpu" : "Select Gpu Family",
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

  Padding _mySRMenu(List<String> myList, witch) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: DropdownButtonFormField<String>(
        value: witch == 'res' ? resolution : screenSize,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "please fill field";
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
          witch == 'res' ? "Select Resolution" : "Select Screen Size",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        onChanged: (value) {
          setState(() {
            witch == 'res' ? resolution = value : screenSize = value;
          });
        },
      ),
    );
  }

  Padding _myLTMenu(List<String> myList, witch) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: DropdownButtonFormField<String>(
        value: witch == 'type' ? type : company,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "please fill this field";
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
          witch == 'type' ? "Select Type" : "Select Company",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        onChanged: (value) {
          setState(() {
            witch == 'type' ? type = value : company = value;
          });
        },
      ),
    );
  }

  Padding _myStorageMenu(List<int> myList, witch) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: DropdownButtonFormField<int>(
        value: witch == 'hdd' ? hdd : ssd,
        validator: (value) {
          if (value == null) {
            return "please fill field";
          }
          return null;
        },
        isExpanded: true,
        menuMaxHeight: 250,
        items: myList.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(
              "$value GB",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
            ),
          );
        }).toList(),
        hint: Text(
          witch == 'hdd' ? "Select hdd size" : "Select ssd size",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        onChanged: (value) {
          setState(() {
            witch == 'hdd' ? hdd = value : ssd = value;
          });
        },
      ),
    );
  }

  Padding _mySlider(witch) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: Slider(
        label: witch == 'ram' ? "$ram GB" : "$state",
        value: witch == 'ram' ? ram : state,
        min: witch == 'ram' ? 2 : 1,
        max: witch == 'ram' ? 32 : 5,
        divisions: witch == 'ram' ? 15 : 4,
        onChanged: (x) => setState(() {
          witch == 'ram' ? ram = x : state = x;
        }),
      ),
    );
  }

  Padding _touchGest() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        height: 70,
        width: 300,
        child: GestureDetector(
          onTap: () => setState(() => touch = !touch),
          child: Container(
            child: Text(touch ? "yes" : "no", textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: touch ? Colors.blue : Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }

  Container _calculate() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Colors.cyan,
          Colors.purpleAccent
        ]),
        borderRadius: BorderRadius.circular(15),
        color: Colors.teal,
      ),
      height: MediaQuery.of(context).size.height / 12,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          var result = 155000;
          if (formKey.currentState!.validate()) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Result(company: company, type: type, cpu: cpu, gpu: gpu, ram: ram, hdd: hdd, ssd: ssd, state: state, prix: result)),
            );
          }
        },
        child: const Text('Calculate', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600)),
      ),
    );
  }

  /*Padding _myButtons(type) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.grey,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(type == 'hdd' ? "$hdd" : "$ssd", style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: type == 'hdd' ? 'hdd--' : 'ssd--',
                  onPressed: () => setState(() {
                    if (type == 'hdd' && hdd < 128) {
                      return;
                    }
                    if (type == 'ssd' && ssd < 128) {
                      return;
                    }
                    type == 'hdd' ? hdd -= 128 : ssd -= 128;
                  }),
                  child: const Icon(Icons.remove),
                  //mini: true,
                ),
                //const SizedBox(width: 15),
                FloatingActionButton(
                  heroTag: type == 'hdd' ? 'hdd++' : 'ssd++',
                  onPressed: () => setState(() {
                    if (type == 'hdd' && hdd > 2000) {
                      return;
                    }
                    if (type == 'ssd' && ssd > 2000) {
                      return;
                    }
                    type == 'hdd' ? hdd += 128 : ssd += 128;
                  }),
                  child: const Icon(Icons.add),
                  //mini: true,
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }*/
}

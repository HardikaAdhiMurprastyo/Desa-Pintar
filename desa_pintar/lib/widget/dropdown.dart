import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({Key? key}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  List<String> items = ['RT1', 'RT2', 'RT3', 'RT4'];
  String? selectedItem = 'RT';

  List<String> items2 = ['RW1', 'RW2', 'RW3', 'RW4'];
  String? selectedItem2 = 'RW';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          child: DropdownButtonFormField<String>(
            hint: Text('RT'),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 61, 192, 150))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 61, 192, 150))),
            ),
            value: selectedItem,
            items: items
                .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                    )))
                .toList(),
            onChanged: (item) => setState(() => selectedItem = item),
          ),
        ),
        const SizedBox(width: 10.0),
        Container(
          width: 150,
          child: DropdownButtonFormField<String>(
            hint: Text('RT'),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 61, 192, 150))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 61, 192, 150))),
            ),
            value: selectedItem2,
            items: items2
                .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                    )))
                .toList(),
            onChanged: (item) => setState(() => selectedItem2 = item),
          ),
        ),
      ],
    );
  }
}

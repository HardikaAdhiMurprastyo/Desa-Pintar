import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownTwo extends StatefulWidget {
  const DropDownTwo({ Key? key }) : super(key: key);

  @override
  State<DropDownTwo> createState() => _DropDownTwoState();
}

class _DropDownTwoState extends State<DropDownTwo> {
  List<String> items = ['Kelurahan 1', 'Kelurahan 2', 'Kelurahan 3', 'Kelurahan 4'];
  String? selectedItem = 'Kelurahan/Desa';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
          child: DropdownButtonFormField<String>(
            hint: Text('Kelurahan/Desa'),
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
    );
  }
}
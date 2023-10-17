import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownSet extends StatefulWidget {
  const DropDownSet({Key? key}) : super(key: key);

  @override
  State<DropDownSet> createState() => _DropDownSetState();
}

class _DropDownSetState extends State<DropDownSet> {
  String dropdownValue = "1 Set";

  List<String> companiesList = ['1 Set', '2 Set', '3 Set', '4 Set', '5 Set'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.sp,
      width: 100.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 1)],
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        icon: const Icon(
          Icons.expand_more,
          color: Colors.blue,
        ),
        iconSize: 20.sp,
        elevation: 16,
        underline: Container(
          color: Colors.transparent,
        ),
        onChanged: (value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        items: companiesList.map((String companiesData) {
          return DropdownMenuItem<String>(
            value: companiesData,
            child: Padding(
              padding: EdgeInsets.only(left: 6.sp),
              child: Text(
                companiesData,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

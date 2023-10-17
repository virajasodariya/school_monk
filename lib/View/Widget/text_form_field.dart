import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_monk/Constants/color.dart';
import 'package:school_monk/Constants/text_style.dart';
import 'package:school_monk/View/Widget/common_text.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.labelText,
    this.maxLength,
    this.isPassword = false,
  });
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final String labelText;
  final int? maxLength;
  final bool isPassword;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 7.5.sp),
          child: commonText(
            text: widget.labelText,
            textStyle: FontTextStyle.kGrey13W400,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          maxLength: widget.maxLength,
          obscureText: widget.isPassword ? isObscureText : false,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: EdgeInsets.only(left: 10.sp),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    icon: Icon(
                      isObscureText
                          ? Icons.visibility_off
                          : Icons.remove_red_eye_outlined,
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: PickColor.kGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: PickColor.kGrey),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}

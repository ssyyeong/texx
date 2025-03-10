import 'package:texx/config/color_constants.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.type,
    required this.onSaved,
    this.hintText,
    this.password,
  });

  final String type;
  final String? hintText;
  final FormFieldSetter? onSaved;
  final String? password; //비밀번호 재입력시 확인 용도

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 'email':
        return emailInput();
      case 'password':
        return passwordInput();
      case 'rePassword':
        return rePasswordInput();
      default:
        return Container();
    }
  }

  Widget emailInput() {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (val) {
          if (val!.isEmpty) {
            return '이메일을 입력해주세요.';
          } else if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(val)) {
            return '이메일 형식이 올바르지 않습니다.';
          } else {
            return null;
          }
        },
        onSaved: onSaved,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
            hintText: hintText ?? '이메일을 입력해주세요.',
            hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ColorConstants.textGray),
            filled: true,
            fillColor: ColorConstants.lightGray));
  }

  Widget passwordInput() {
    return TextFormField(
        obscureText: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (val) {
          if (val!.isEmpty) {
            return '비밀번호를 입력해주세요.';
          } else if (val.length < 8 || val.length > 12) {
            return '비밀번호 길이가 맞지 않습니다.';
          } else {
            return null;
          }
        },
        onSaved: onSaved,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
            hintText: '비밀번호를 입력해주세요.(8~12자리)',
            hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ColorConstants.textGray),
            filled: true,
            fillColor: ColorConstants.lightGray));
  }

  Widget rePasswordInput() {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (val) {
          if (val!.isEmpty) {
            return '비밀번호를 입력해주세요.';
          } else {
            return null;
          }
        },
        onSaved: onSaved,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
            hintText: '비밀번호를 재입력해주세요.',
            hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ColorConstants.textGray),
            filled: true,
            fillColor: ColorConstants.lightGray));
  }
}

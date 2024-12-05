import 'package:flutter/material.dart';
import 'package:flutter_markte_app/core/validator_util.dart';

class PasswordTextFormField extends StatelessWidget {
  TextEditingController controller;

  PasswordTextFormField(this.controller);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: '비밀번호를 입력해 주세요'),
      obscureText: true,
      validator: ValidatorUtil.validatorPassword,
    );
  }
}

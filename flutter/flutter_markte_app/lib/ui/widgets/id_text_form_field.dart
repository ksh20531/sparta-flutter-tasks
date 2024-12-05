import 'package:flutter/material.dart';
import 'package:flutter_markte_app/core/validator_util.dart';

class IdTextFormField extends StatelessWidget {
  TextEditingController controller;

  IdTextFormField(this.controller);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: '아이디를 입력해 주세요'),
      validator: ValidatorUtil.validatorId,
    );
  }
}

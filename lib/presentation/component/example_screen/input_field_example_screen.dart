import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/input_field.dart';

class InputFieldExampleScreen extends StatelessWidget {
  const InputFieldExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InputField 예제')),
      body: Column(
        children: [
          InputField(
            label: 'Lable',
            placeHolder: 'PlaceHolder',
            value: '',
            onValueChange: (value) {},
          ),
          InputField(
            label: 'Lable',
            placeHolder: 'PlaceHolder',
            value: 'PlaceHolder',
            onValueChange: (value) {},
          ),
          InputField(
            label: 'Lable',
            placeHolder: 'PlaceHolder',
            value: 'PlaceHolder',
            isDisabled: true,
            onValueChange: (value) {},
          ),
        ],
      ),
    );
  }
}

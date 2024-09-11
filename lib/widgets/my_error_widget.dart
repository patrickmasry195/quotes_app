import 'package:flutter/material.dart';
import 'package:quotes_app/widgets/custom_button.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 20,
            ),
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          CustomButton(
            width: 145,
            height: 53,
            buttonName: 'Try Again',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

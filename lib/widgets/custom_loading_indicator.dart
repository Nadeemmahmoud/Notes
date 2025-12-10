import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 24, width: 24, child: CircularProgressIndicator());
  }
}

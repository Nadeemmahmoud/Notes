import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/constants.dart';
import 'package:notes_app/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.ontap,
    this.isLoading = false,
  });
  final String text;
  final VoidCallback? ontap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          height: 50,
          width: double.infinity,
          child: isLoading
              ? Center(
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(),
                  ),
                )
              : Center(child: CustomText(text: text, fontSize: 20)),
        ),
      ),
    );
  }
}

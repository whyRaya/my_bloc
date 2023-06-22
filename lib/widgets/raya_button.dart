import 'package:flutter/material.dart';
import 'package:my_bloc/widgets/raya_text.dart';

class RayaButton extends StatelessWidget {
  const RayaButton({
    super.key,
    this.text = "",
    this.textState = RayaTextState.m16,
    this.textColor = Colors.white,
    this.onTap
  });

  final String text;
  final RayaTextState textState;
  final Color textColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple),
        child: Row(
          children: [
            RayaText(text: text, textState: textState, color: textColor),
            const Icon(
              Icons.navigate_next,
              color: Colors.white,
            )
          ],
        ));
  }
}

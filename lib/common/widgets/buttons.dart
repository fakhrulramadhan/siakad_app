import 'package:flutter/material.dart';
import 'package:siakad_app/common/constants/colors.dart';

enum ButtonStyle { filled, outlined }

class Button extends StatelessWidget {
  const Button.filled(
      {super.key,
      required this.onPressed,
      required this.label,
      this.style = ButtonStyle.filled,
      this.color = ColorName.primary,
      this.textColor = Colors.white,
      this.width = double.infinity,
      this.height = 50,
      this.borderRadius = 6.0,
      this.icon});

  const Button.outlined(
      {super.key,
      required this.onPressed,
      required this.label,
      this.style = ButtonStyle.outlined,
      this.color = ColorName.white,
      this.textColor = ColorName.black,
      this.width = double.infinity,
      this.height = 50,
      this.borderRadius = 6.0,
      this.icon});

  //final Function() onPressed; voidcallback tipe datanya  berupa fungsi
  final VoidCallback onPressed;
  final String label;
  final ButtonStyle style;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: style == ButtonStyle.filled
            ? //button
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
                onPressed: onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon ?? const SizedBox.shrink(),
                    if (icon != null)
                      const SizedBox(
                        height: 10.0,
                      ),
                    Text(
                      label,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                  ],
                ),
              )
            : OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                  backgroundColor: color,
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon ??
                        const SizedBox
                            .shrink(), //kalau g ada icon, maka dikasih spasi
                    // jika icon ada, maka di kasih spasi
                    if (icon != null)
                      const SizedBox(
                        height: 10.0,
                      ),
                    Text(
                      label,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                  ],
                ),
              ));
  }
}

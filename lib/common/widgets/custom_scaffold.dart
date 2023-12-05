import 'package:flutter/material.dart';
import 'package:siakad_app/common/constants/colors.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? body;
  final bool useExtraPadding;
  final double paddingTop;
  final Widget? bottomNavigationBar;

  const CustomScaffold(
      {super.key,
      this.body,
      this.useExtraPadding = false,
      this.paddingTop = 20,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primary,
      body: useExtraPadding
          ? Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 120,
                  margin: const EdgeInsets.only(top: 60),
                  padding: const EdgeInsets.only(bottom: 60),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                ),
                SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: paddingTop,
                  ),
                  child: body,
                )),
              ],
            )
          : SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 60),
                  padding: const EdgeInsets.only(bottom: 60),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  child: body),
            ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

import 'package:flutter/material.dart';
class Showemptywidget extends StatelessWidget {
  const Showemptywidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
                      children: [
                      //  SizedBox(height: 150),
                      Image.asset('assets/EmptyForVisiblty.png',
                      height: 190,
                      ),
                       Image.asset('assets/EmptyForVisibilty2.png',
                      height: 380,
                      ),
                      ],
                    );
  }
}
import 'package:flutter/material.dart';
import 'package:san3a/modules/Admin/AdminScreen.dart';
import 'package:san3a/shared/component/component.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: (){
                      navigateTo(context, AdminScreen());
                    },
                    icon: Icon(Icons.arrow_back),
                  iconSize: 30.0,
                ),
                Center(
                  child: Text(' All Payment',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 3.0,
            ),
          ],
        ),
      ),
    );
  }
}

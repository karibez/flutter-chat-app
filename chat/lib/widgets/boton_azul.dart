import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
 
  final VoidCallback onPressed;
  final String texto;

   const BotonAzul({super.key,  required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              elevation: 5,
            ),
            
            onPressed: this.onPressed,
            child: Container(
              width: double.infinity,
              height: 55,
              child:  Center(
                child: Text(texto, style: TextStyle(color:Colors.white, fontSize: 15)),),
            ),);
  }
}
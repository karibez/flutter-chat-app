import 'package:flutter/material.dart';


class Logo extends StatelessWidget {

  final String titulo;

   Logo({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        
        margin: const EdgeInsets.only(top:30),
        child:  Column(
          children: [

            Image(image: AssetImage('assets/tag-logo.png'),),
            Text(titulo, style: TextStyle(fontSize: 20)),

        ],
        
        )
        
        
        ),
    );
  }
}
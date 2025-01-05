import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/usuarios_page.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



  @override
class LoadingPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder:(context, snapshot){
          return const Center(
          child: Text('Autenticando....'),
             );
        }
        
        
      ),
   );
  }

  Future checkLoginState ( BuildContext context) async {

    final authService = Provider.of<AuthService>(context, listen:false);

    final autenticado = await authService.isLoggedIn();

    if (autenticado){
      //TODO: conectar al socket server
      //Navigator.pushReplacementNamed(context, 'usuarios');
      Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: ( _, __, ___ ) => UsuariosPage(),
        transitionDuration: const Duration(milliseconds: 0)
        )
        );
    }else{
      //Navigator.pushReplacementNamed(context, 'login');
       Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: ( _, __, ___ ) => LoginPage(),
        transitionDuration: const Duration(milliseconds: 0)
        )
        );
    }

  }


}
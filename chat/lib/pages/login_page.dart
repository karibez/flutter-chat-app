import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';



  @override
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics:  BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height*0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[
                 Logo(titulo: 'Login'),
                _Form(),
                const Labels(ruta:'register', texto1:'¿No tienes una cuenta?',texto2:'Crea una ahora!!'),
            
                const Text('Términos y condiciones de uso', style: TextStyle(fontWeight:FontWeight.w200 )),
              ] 
                 ),
          ),
        ),
      ),
   );
  }
}







class _Form extends StatefulWidget {

  @override
  State<_Form> createState() => __FormState();
}
class __FormState extends State<_Form> {

 final emailCtrl = TextEditingController();
 final passCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:40),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child:  Column(
        children:<Widget> [
          
         CustomInput(
          icon:Icons.mail_outlined,
          placeholder: 'Correo',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
         ),

         CustomInput(
          icon:Icons.lock_outlined,
          placeholder: 'Contraseña',
          //keyboardType: TextInputType.emailAddress,
          textController: passCtrl,
          isPassword: true,
         ),
        
          // TODO: Crear Boton
          BotonAzul(texto:'Ingrese',onPressed: () {
            print(emailCtrl.text);
            print(passCtrl.text);
          },),

        ],
      ),

    );
  }
}

